<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome <%=session.getAttribute("name")%></title>
</head>
<body>
    <h3>Login successful!!!!!!!!!!!!!!</h3>
	<h2>hopefully this only pushes to the cacc0014 branch</h2>
    <h4>
        Hello,
        <%=session.getAttribute("name")%></h4>
</body>
</html>