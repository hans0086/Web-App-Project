<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
    <%@ page import=" java.sql.*" import="java.util.*" %>
<html>
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Billing</title>
</head>
<body>
<body>
<section>
<span></span>
	<h1>Payment Information</h1>
		<%
		try{

			Class.forName("com.mysql.jdbc.Driver"); 
			String url = "jdbc:mysql://localhost:3306/"; // the location of the database
			String dbName = "gaming"; // the database to execute the query on
			String driver = "com.mysql.jdbc.Driver"; // the database driver used to connect to the database
			String userName = "root"; // the database user name
			String password = "yA600260"; // the database password
			double sub_total = 0.0;
			//String searchQ =request.getParameter("searchAnchor");
			Connection conn = DriverManager.getConnection(url + dbName, userName, password);
	
	        Statement statement = conn.createStatement();
	        ResultSet rs;
	        String username = (String)session.getAttribute("name");
	        String userStatement = "SELECT userFirstName,userLastName," +
	        		"userAddress,userCity,userCountry,"+
	        		"userPostalCode,userEmail,userPhone FROM gaming.users WHERE username='" + username + "'";
	        rs = statement.executeQuery(userStatement);
	        rs.next();%>
        <form action="billingServlet" method="post">
            <select name="card">
            	<option value="Visa">Visa</option>
            	<option value="Master Card">Master Card</option>
            	<option value="American Express">American Express</option>
            </select>
            <input type="text" name="cardNumber" required="required" placeholder="Card Number" />
            <select name="month">
            	<%for(int i = 1;i < 13;++i){%>
            		<option value=<%= i < 10 ?"0":"" +i%> ><%= i < 10 ? "0"+i:""+i%> </option>
            	<% } %>
            </select>
            <select name="year">
            	<%for(int i = 2015;i < 2041;++i){%>
            		<option value=<%=i%>><%=i%> </option>
            	<%}%>
            </select>
            <input type="text" name="securityCode" required="required" maxLength="3"/>
            <input type="text" name="userFirstName" required="required" value='<%=rs.getString(1) %>' />
            <input type="text" name="userLastName" required="required" value='<%=rs.getString(2) %>' />
            <input type="text" name="userAddress" required="required" value='<%=rs.getString(3) %>' />
            <input type="text" name="userCity" required="required" value='<%=rs.getString(4) %>' />
            <input type="text" name="userCountry" required="required" value='<%=rs.getString(5) %>' />
            <input type="text" name="userPostalCode" required="required" value='<%=rs.getString(6) %>' />
            <input type="text" name="userEmail" required="required" value='<%=rs.getString(7) %>' />
            <input type="text" name="userPhone" required="required" value='<%=rs.getString(8) %>' />
            <button type="submit" value="ConFirm Billing">Continue</button>
        </form>
        <%} catch(Exception e){%> <h5><%=e.toString() %></h5> <% } %>
</section>
</body>
</html>