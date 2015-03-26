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
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

/**
 * Servlet implementation class addToCart
 */
@WebServlet("/addToCart")
public class addToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addToCart() {
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
		ArrayList<String> cartList = new ArrayList<String>();
		String title = request.getParameter("title");
		int current_titleCount = 0;
		int inventory = 0;
		cartList = (ArrayList<String>) session.getAttribute("cartItemArray");
		try{
			for(int i = 0;i < cartList.size();++i)
				if(cartList.get(i).contains(title))
					++current_titleCount;
			
			conn = (Connection) DriverManager.getConnection(url + dbName, "root", "yA600260");
			Statement statement = conn.createStatement();			
			String inventoryStatement = "SELECT productInventory "
					+ "FROM gaming.products WHERE productName='" + title + "'";/*grab Inventory*/
			rs = statement.executeQuery(inventoryStatement);
			rs.next();
			inventory = rs.getInt(1);
			if((inventory - current_titleCount) <= 0)
			{
				/*set error label and redirect to ChosenItem page*/
				request.setAttribute("error", "Item out of stock or current amount in cart is maxed");
				request.getRequestDispatcher("chosenItem.jsp?val="+title).forward(request, response);
			}
			else
			{
				int cart_count = (int)session.getAttribute("cart_count");
				session.setAttribute("cart_count",++cart_count);
				cartList.add(title + "_" + cart_count);
				session.setAttribute("cartItemArray", cartList);
				request.getRequestDispatcher("shoppingCart.jsp").forward(request, response);				
			}
		}catch(Exception e){
		}		
	}
}
