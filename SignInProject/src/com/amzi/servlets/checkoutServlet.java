package com.amzi.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.security.Security;

import java.sql.DriverManager;
import java.util.*;
import java.util.Date;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.activation.*;
import javax.naming.*;
import javax.mail.*;
import javax.mail.internet.*;


/**
 * Servlet implementation class checkoutServlet
 */
@WebServlet("/checkoutServlet")
public class checkoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		/*sql connection information*/
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "gaming";
		String driver = "com.mysql.jdbc.Driver";
		
		ResultSet rs;/*the results of queries*/
		
		/*creating a unique order number*/
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Map<String,String> billingInfo = (HashMap<String,String>)session.getAttribute("billingInfo");
		Date date = new Date();
		String orderId = Security.hashPassword((String)session.getAttribute("name") + dateFormat.format(date));
		
		
		ArrayList<String> cart = (ArrayList<String>)session.getAttribute("cartItemArray");/*the shopping cart*/
		try{
			/*create the connection and statement*/
			conn = (Connection) DriverManager.getConnection(url + dbName, "root", "yA600260");
			Statement statement = conn.createStatement();
			/*loop through cart and create a new order for each item*/
			for(int i = 0;i < cart.size();++i)
			{
				
				String pName = cart.get(i).split("_")[0];/*product name*/
				String status = "TO BE SHIPPED";/*status of the order*/
				String inventoryStatement = "SELECT productInventory,productPrice "
						+ "FROM gaming.products WHERE productName='" + pName + "'";/*grab Inventory and price*/
				rs = statement.executeQuery(inventoryStatement);
				rs.next();
				int inventory = rs.getInt(1);
				String price = rs.getString(2);

				if(inventory <= 0)/*if there are no copies left we must create a back-order*/
					status = "BACK ORDER";
				else/*reduce inventory and update table*/
				{
					--inventory;
					inventoryStatement = "UPDATE gaming.products SET productInventory='" + inventory + "' " +
							 "WHERE productName='" + pName + "'";
					statement.executeUpdate(inventoryStatement);
				}
				/*create a new order entry*/
				String orderStatement = "INSERT INTO gaming.orders (orderId,user,"
						+ "email,address,city,country,postalCode,phone,orderStatus,productName,price)"
						+ " VALUES('" + orderId + "','" + (String)session.getAttribute("name") + "','"
						+ billingInfo.get("userEmail") + "','" + billingInfo.get("userAddress") 
						+ "','" + billingInfo.get("userCity") + "','" + billingInfo.get("userCountry") + "','"
						+ billingInfo.get("userPostalCode") + "','" + billingInfo.get("userPhone") + "','"
						+ status  + "','" + pName + "','" + price + "');";
				statement.executeUpdate(orderStatement);
			}
			cart.clear();/*clear the contents of the cart*/
			session.setAttribute("cartItemArray",cart);
			
			String emailStatement = "SELECT productName,price,orderStatus FROM gaming.orders "
					+ "WHERE orderId='" + orderId + "'";
			rs = statement.executeQuery(emailStatement);
			String emailContent = "<h3>Hello " + billingInfo.get("userFirstName") + 
					" " + billingInfo.get("userLastName") + "</h3><br /><br />";
			while(rs.next()){
				emailContent += "<h5>" + rs.getString(1) + " $" + rs.getString(2) + 
						" " + rs.getString(3) + "</h5><br /><br />";
			}
			emailContent += "<p>" + billingInfo.get("userAddress") + "<br/>" + billingInfo.get("userCity") +
					"<br />" + billingInfo.get("userCountry") + "<br />" + billingInfo.get("userPostalCode") +
					"<p>";
			
			/*get the tomcat email session*/
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			Session emailSession = (Session) envCtx.lookup("mail/Session");			
			
			try
			{
				/*creat and send the email recipt for the orders.*/
				MimeMessage message = new MimeMessage(emailSession);
				message.setFrom(new InternetAddress("orders.gamingorders@gmail.com"));
				message.addRecipient(Message.RecipientType.TO,
						new InternetAddress(billingInfo.get("userEmail")));
				message.setSubject("DO NOT REPLY Order Recipt order NO: " + orderId);
				message.setContent(emailContent,"text/html");
				Transport.send(message);
				System.out.println("Sent Message.");
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			billingInfo.clear();/*clear the contents of the billingInfo*/
			session.setAttribute("billingInfo",billingInfo);
			request.getRequestDispatcher("OrderSent.jsp").forward(request, response);
			conn.close();
		} catch (Exception e) {
		}
	}
}
