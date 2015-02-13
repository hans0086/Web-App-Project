package com.amzi.servlets;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.labels.CommonConstants;

public class CheckAvailability extends HttpServlet {

	private static final long serialVersionUID = -734503860925086969L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String connectionURL = "jdbc:mysql://localhost:3306/gaming";
			Connection connection = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(connectionURL, "root", CommonConstants.dbPassword); // Connect to
																											// the DB
			String uname = request.getParameter("uname"); // Select the username
			PreparedStatement ps = connection.prepareStatement("select username from users where username=?");
			ps.setString(1, uname);
			ResultSet rs = ps.executeQuery();

			if (!rs.next()) { // If no result, then the username doesn't exist and is available
				out.println("<font color=\"green\"><b>" + uname + "</b> is avaliable</font>");
			} else { // Otherwise it is in use
				out.println("<font color=\"red\"><b>" + uname + "</b> is already in use</font>");
			}
			out.println();

		} catch (Exception ex) {
			out.println("Error ->" + ex.getMessage());
		} finally {
			out.close();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}