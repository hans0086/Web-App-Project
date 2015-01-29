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
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "gaming";
		String driver = "com.mysql.jdbc.Driver";
		HttpSession session = request.getSession(false);

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
							+ "', 'no')");// try2 is the name of the table

			int i = pst.executeUpdate();
			conn.close();
			String msg = " ";
			if (i != 0) {
				//msg = "Record has been inserted";
				//pw.println("<font size='6' color=blue>" + msg + "</font>");
				if (session != null)
					session.setAttribute("username", username);
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
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
