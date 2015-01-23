<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Application</title>
</head>
<body>
	<section>
		<span></span>
		<h1>Member Login</h1>
		<form action="loginServlet" method="post">
			<input type="text" name="username" required="required" placeholder="User Name" />
			<input type="password" name="userpass" required="required" placeholder="Password" />
			<button type="submit" value="Login">LOGIN</button>
		</form>
		<h2>
			<a href='#'>Create Account</a>
			<br />
			<a href='#'>Forgot Password?</a>
		</h2>
	</section>
</body>
</html>