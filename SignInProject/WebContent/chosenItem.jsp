<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import=" java.sql.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%= request.getParameter("val") %></title>
</head>
<body>
<section>
<span></span>
<b><%= request.getParameter("val") %></b>
<%if(request.getAttribute("error") != null){ //If error attrubite exists, alert user to item out of stock
	out.print("<div class=\"error\">Item is out of stock or current cart equals inventory</div>");
} else{
	out.print("<div class=\"error\"></div>");
}%>
<table>
<% 
	Class.forName("com.mysql.jdbc.Driver"); 
		String url = "jdbc:mysql://localhost:3306/"; // the location of the database
		String dbName = "gaming"; // the database to execute the query on
		String driver = "com.mysql.jdbc.Driver"; // the database driver used to connect to the database
		String userName = "root"; // the database user name
		String password = "yA600260"; // the database password
		//String searchQ =request.getParameter("searchAnchor");
		Connection conn = DriverManager.getConnection(url + dbName, userName, password);
		String title = request.getParameter("val");
        Statement statement = conn.createStatement();
        ResultSet rs;
        rs= statement.executeQuery("SELECT productPic,productDesc,productSystem,productPrice FROM gaming.products WHERE productName='"+title+"'");
       
        while(rs.next()){%>
        <tr class="separating_line">
        	<td><img src="<%=rs.getString(1)%>" height="150" width="150" vspace="10"></td>
        </tr>
        <tr class="separating_line">
        	<td><%=rs.getString(2) %></td>
        </tr>
        <tr class="separating_line">
        	<td><%=rs.getString(3) %></td>
        </tr>
        <tr class="separating_line">
        <td><%=rs.getString(4) %></td>
        </tr>
        <% } 
        %>
        <tr>
        	<td>
        		<form action="addToCart" method="post">
	        		<input  name="title" type="hidden" value="<%=request.getParameter("val")%>"/>
	        		<button type="submit" value="AddToCart">Add To Cart</button>
        		</form>
        	</td>
        </tr>
</table>       
</section>
</body>
</html>
