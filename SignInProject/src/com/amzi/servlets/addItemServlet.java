package com.amzi.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class createAccountServlet
 */
@WebServlet("/addItemServlet")
public class addItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addItemServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "gaming";
		String driver = "com.mysql.jdbc.Driver";
		HttpSession session = request.getSession(false);

		try {
			String pName = request.getParameter("productName");//get the username from the username field
			String pSystem = request.getParameter("productSystem");//get the password from the password field
			String pInv = request.getParameter("productInventory");//get the First Name from the First Name field
			String pPrice = request.getParameter("productPrice");//get the Last Name from the last name field

			Class.forName(driver).newInstance();
			conn = (Connection) DriverManager.getConnection(url + dbName, "root", "yA600260");//create a connection to the database

			PreparedStatement pst = (PreparedStatement)conn
					.prepareStatement("INSERT INTO gaming.products(productName,productSystem,productInventory,productPrice) values('"
							+ pName
							+ "' ,'"
							+ pSystem
							+ "' ,'"
							+ pInv
							+ "','"
							+ pPrice
							+ "')");// create a new record in the users table by adding the input values into their appropriate columns in the database

			int i = pst.executeUpdate();
			conn.close();//close the connection to the database
			String msg = " ";
			if (i != 0) {
				if (session != null){}
					//session.setAttribute("user", username);//keep the username in the session
				RequestDispatcher rd = request.getRequestDispatcher("catalog.jsp");//go back to the index page after creating an account
				rd.forward(request, response);

			} else {//if the database failed to enter the record
				msg = "Failed to insert the data";
				pw.println("<font size='6' color=blue>" + msg + "</font>");
			}
			pst.close();
		} catch (Exception e) {
			pw.println(e);
		}
	}
}
