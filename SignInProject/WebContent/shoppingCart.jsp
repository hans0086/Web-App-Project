<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
    <%@ page import=" java.sql.*" import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Shopping Cart</title>
</head>
<body>
<section>
<h1>Shopping Cart</h1>
<span></span>
	<Table>
		<%
		try{

		Class.forName("com.mysql.jdbc.Driver"); 
		String url = "jdbc:mysql://localhost:3306/"; // the location of the database
		String dbName = "gaming"; // the database to execute the query on
		String driver = "com.mysql.jdbc.Driver"; // the database driver used to connect to the database
		String userName = "root"; // the database user name
		String password = "yA600260"; // the database password
		//String searchQ =request.getParameter("searchAnchor");
		Connection conn = DriverManager.getConnection(url + dbName, userName, password);

        Statement statement = conn.createStatement();
        ResultSet rs;
 	    ArrayList<String> cart = new ArrayList<String>();
 	    cart = (ArrayList<String>)session.getAttribute("cartItemArray");
        String cartStatement = "SELECT productPic,productName, productPrice FROM gaming.products ";
        for(int i = 0;i < cart.size();++i)
        {
        	if(i == 0)
        		cartStatement = cartStatement + "WHERE productName='" +cart.get(i)+"' ";
        	else
        		cartStatement = cartStatement + "OR productName='" +cart.get(i)+"' ";
        		
        }
        rs = statement.executeQuery(cartStatement);
        
        while(rs.next())
        {%>
        	<tr class="separating_line">
        		<td><img src="<%=rs.getString(1)%>" height="150" width="150" vspace="10"></td>
        		<td><%=rs.getString(2) %></td>
        		<td><%=rs.getString(3) %></td>
        		<td><button id="removeFromCart" name="removeFromCart" onClick="removeFromCart()" value="<%=rs.getString(1)%>">Remove</button></td>
        	</tr>
        <%}
       } catch(Exception e){}%>
           </Table>


</section>
</body>
<script>
function removeFromCart(){
	ArrayList<String> cartList = new ArrayList<String>();
	cartList = (ArrayList<String>) session.getAttribute("cartItemArray");
	String title = document.getElementById('removeFromCart').value;
	
	session.setAttribute("cartItemArray", cartList);
}
</script>
</html>