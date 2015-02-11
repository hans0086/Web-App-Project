<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import=" java.sql.*" %>
<html>
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Store Catalog</title>
</head>
<body>
	<section>
		<span></span>
		<h1>Catalog</h1>
		
		<table border = 1>
            	<tr>
               		<th>Product Name</th>
               		<th>Console</th>
               		<th>Amount Available</th>
               		<th>Price</th>
           		</tr>
		<%
		try {
			Class.forName("com.mysql.Jdbc.Driver"); 
			String url = "jdbc:mysql://localhost:3306/"; // the location of the database
			String dbName = "gaming"; // the database to execute the query on
			String driver = "com.mysql.jdbc.Driver"; // the database driver used to connect to the database
			String userName = "root"; // the database user name
			String password = "BlackSox2012"; // the database password
			Connection conn = DriverManager.getConnection(url + dbName, userName, password);
	
	        Statement statement = conn.createStatement();
	        ResultSet rs = statement.executeQuery("SELECT productName, productSystem, productInventory, productPrice FROM gaming.products"); 
	
	        while (rs.next()) { %>
		        <tr>
			        <td> <%rs.getString(1);%> </td>
			        <td> <%rs.getString(2);%> </td>
			        <td> <%rs.getString(3);%> </td>
			        <td> <%rs.getString(4);%> </td>
			        <td>TEST</td>
			   	</tr>
			<%}
		}
        catch (Exception ex) {}
        %>
        </table>
	</section>
	<br />
      
</body>
</html>
