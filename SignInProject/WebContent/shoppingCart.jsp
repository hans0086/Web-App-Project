<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
    <%@ page import=" java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Shopping Cart</title>
</head>
<body>
<section>
<span></span>
	<Table>
            	<TR>
               		<TH>Product Name</TH>
               		<TH>Price</TH>
           		</TR>
		<%
		try{

		Class.forName("com.mysql.jdbc.Driver"); 
		String url = "jdbc:mysql://localhost:3306/"; // the location of the database
		String dbName = "gaming"; // the database to execute the query on
		String driver = "com.mysql.jdbc.Driver"; // the database driver used to connect to the database
		String userName = "root"; // the database user name
		String password = "Mat20134"; // the database password
		//String searchQ =request.getParameter("searchAnchor");
		Connection conn = DriverManager.getConnection(url + dbName, userName, password);

        Statement statement = conn.createStatement();
        ResultSet rs;
       
       // if (searchQ == null){
        	//searchQ = "SELECT productName, productSystem, productInventory, productPrice FROM gaming.products";
       // }
        
        
       // rs = statement.executeQuery("SELECT productName, productPrice FROM gaming.products") ; 
	   ArrayList cart = new ArrayList();
	   cart = (ArrayList) session.getAttribute("cartItemArray");
	   pageContext.setAttribute("shopCart",cart);
        %>
           <c:forEach items="${shopCart}" var="current">
           	<tr>
           		<td><c:out value="${current}" /></td>
           		<td></td>
           	</tr>
           	</c:forEach>
           </Table>


</section>
</body>
</html>