<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
		<a href='catalog.jsp'>Catalog</a>
	</h2>
</section>
</body>
</html>