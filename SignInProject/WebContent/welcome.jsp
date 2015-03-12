<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.*"%>
<html>
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome <%=session.getAttribute("name")%></title>
</head>
<body>
<section>
<span></span>
	<h1>User Login Successful</h1>
    <h2>
        Hello, <%=session.getAttribute("name")%>
	</h2>
	<br />
	<h2>
		<a href='catalog.jsp'>View Catalog</a>
		<a href='shoppingCart.jsp'>Shopping Cart</a>
	</h2>
	<%if(session.getAttribute("cartItemArray") == null)
	{
		ArrayList<String> cartList = new ArrayList<String>();
		session.setAttribute("cartItemArray",cartList); 
	}%>
</section>
</body>
</html>