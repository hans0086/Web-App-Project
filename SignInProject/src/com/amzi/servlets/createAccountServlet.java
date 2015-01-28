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
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		// String connectionURL = "jdbc:mysql://127.0.0.1:3306/newData"; //newData is the database
		// Connection connection;
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "gaming";
		String driver = "com.mysql.jdbc.Driver";
		HttpSession session = request.getSession(false);
		// String dbUserName = "root";
		// String dbPassword = "root";

		try {
			String username = request.getParameter("username");
			String userpass = request.getParameter("userpass");
			String firstName = request.getParameter("userFirstName");
			String lastName = request.getParameter("userLastName");
			String address = request.getParameter("userAddress");
			String country = request.getParameter("userCountry");
			String city = request.getParameter("userCity");
			String postalCode = request.getParameter("userPostalCode");
			String email = request.getParameter("userEmail");
			String phone = request.getParameter("userPhone");

			Class.forName(driver).newInstance();
			conn = (Connection) DriverManager.getConnection(url + dbName, "root", "BlackSox2012");

			PreparedStatement pst = (PreparedStatement)conn
					.prepareStatement("INSERT INTO gaming.users(username,userpass,userFirstName,userLastName,userAddress,userCountry,userCity,userPostalCode,userEmail,userPhone) values('"
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
							+ "')");// try2 is the name of the table

			// pst.setString(1,username);
			// pst.setString(2,userpass);
			// pst.setString(3,firstName);
			// pst.setString(4,lastName);
			// pst.setString(5,address);
			// pst.setString(6,country);
			// pst.setString(7,city);
			// pst.setString(8,postalCode);
			// pst.setString(9,email);
			// pst.setString(10, phone);

			int i = pst.executeUpdate();
			conn.close();
			String msg = " ";
			if (i != 0) {
				//msg = "Record has been inserted";
				//pw.println("<font size='6' color=blue>" + msg + "</font>");
				if (session != null)
					session.setAttribute("username", username);
				RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
				rd.forward(request, response);

			} else {
				msg = "Failed to insert the data";
				pw.println("<font size='6' color=blue>" + msg + "</font>");
			}
			pst.close();
		} catch (Exception e) {
			pw.println(e);
		}
	}
}
