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
@WebServlet("/createAccountServlet")
public class createAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public createAccountServlet() {
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
			String username = request.getParameter("username");//get the username from the username field
			String userpass = request.getParameter("userpass");//get the password from the password field
			String firstName = request.getParameter("userFirstName");//get the First Name from the First Name field
			String lastName = request.getParameter("userLastName");//get the Last Name from the last name field
			String address = request.getParameter("userAddress");//get the address from the address field
			String country = request.getParameter("userCountry");//get the country from the country field
			String city = request.getParameter("userCity");//get the city from the city field
			String postalCode = request.getParameter("userPostalCode");//get the postal code from the postal code field
			String email = request.getParameter("userEmail");//get the email from the email field
			String phone = request.getParameter("userPhone");// get the phone # from the phone @ field

			Class.forName(driver).newInstance();
			conn = (Connection) DriverManager.getConnection(url + dbName, "root", "Mat20134");//create a connection to the database

			PreparedStatement pst = (PreparedStatement)conn
					.prepareStatement("INSERT INTO gaming.users(username,userpass,userFirstName,userLastName,userAddress,userCountry,userCity,userPostalCode,userEmail,userPhone,userIsAdmin) values('"
							+ username
							+ "' ,'"
							+ userpass
							+ "' ,'"
							+ firstName
							+ "','"
							+ lastName
							+ "','"
							+ address
							+ "','"
							+ country
							+ "','"
							+ city
							+ "','"
							+ postalCode
							+ "','"
							+ email
							+ "','"
							+ phone
							+ "', 'n')");// create a new record in the users table by adding the input values into their appropriate columns in the database

			int i = pst.executeUpdate();
			conn.close();//close the connection to the database
			String msg = " ";
			if (i != 0) {
				if (session != null)
					session.setAttribute("username", username);//keep the username in the session
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");//go back to the index page after creating an account
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
