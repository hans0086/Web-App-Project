package com.amzi.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;

import java.sql.DriverManager;
import java.util.*;
import java.util.Date;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

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
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "gaming";
		String driver = "com.mysql.jdbc.Driver";
		ResultSet rs;
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Map<String,String> billingInfo = (HashMap<String,String>)session.getAttribute("billingInfo");
		Date date = new Date();
		String orderId = (String)session.getAttribute("name") + dateFormat.format(date);
		
		ArrayList<String> cart = (ArrayList<String>)session.getAttribute("cartItemArray");
		
		try{
			conn = (Connection) DriverManager.getConnection(url + dbName, "root", "yA600260");
			Statement statement = conn.createStatement();
			for(int i = 0;i < cart.size();++i)
			{
				String pName = cart.get(i).split("_")[0];
				String inventoryStatement = "SELECT productInventory "
						+ "FROM gaming.products WHERE productName=" + "'" + pName + "'";
				rs = statement.executeQuery(inventoryStatement);
				rs.next();
				int inventory = rs.getInt(1);

				if(inventory <= 0)
				{
					
				}
				else
				{
					
				}
			}
		} catch (Exception e) {
		}
	}
}
