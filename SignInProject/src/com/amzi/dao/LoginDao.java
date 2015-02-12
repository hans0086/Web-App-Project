package com.amzi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Attempts to log into the database as an regular user using the specified user name and password,
 * and then closes the database connection once login is complete.
 * @author Benjamin, Mat, Tony, Steven
 * @version 0.1
 */
public class LoginDao {
	
	/**
	 * Validates the specified user name and password and determines if the user logging in is a regular user.
	 * @param name The user name of the user logging in
	 * @param pass The password of the user logging in
	 * @return Whether or not a row of data was returned from the database
	 */
	public static boolean validate(String name, String pass) {
		boolean status = false; // status of the first row returned
		Connection conn = null; // a connection to the database
		PreparedStatement pst = null; // the SQL statement executed on the database
		ResultSet rs = null; // the results of the database query

		String url = "jdbc:mysql://localhost:3306/"; // the location of the database
		String dbName = "gaming"; // the database to execute the query on
		String driver = "com.mysql.jdbc.Driver"; // the database driver used to connect to the database
		String userName = "root"; // the database user name
		String password = "Mat20134"; // the database password

		try {
			Class.forName(driver).newInstance(); // create a new driver class instance
			conn = DriverManager.getConnection(url + dbName, userName, password); // connect to the database

			// prepare SQL statement in advance of executing the query
			pst = conn.prepareStatement("select * from gaming.users where username=? and userpass=?");
			pst.setString(1, name); // substitute user name into SQL query
			pst.setString(2, pass); // substitute password into SQL query
			rs = pst.executeQuery(); // execute the SQL query
			status = rs.next(); // update the status

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			if (conn != null) { // if the database is connected
				try {
					conn.close(); // close the database connection and its resources
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pst != null) { // if the prepared statement is not null
				try {
					pst.close(); // close the prepared statement and its resources
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (rs != null) { // if the results set is not null
				try {
					rs.close(); // close the results set and its resources
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return status; // return whether or not the login was successful
	}
}
