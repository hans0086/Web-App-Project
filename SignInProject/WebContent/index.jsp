<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com" />
<html lang="${language}">
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Application</title>
</head>
<body>
	<section>
		<span></span>
		<h1>Member Login</h1>
		<select id="language" name="language" onchange="submit()">
                <option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
                <option value="fr" ${language == 'fr' ? 'selected' : ''}>French</option>
            </select>
		<form action="loginServlet" method="post">
		<label for="username"><fmt:message key="login.label.username"/></label>
			<input type="text" name="username" required="required" placeholder="User Name" />
			<input type="password" name="userpass" required="required" placeholder="Password" />
			<button type="submit" value="Login">LOGIN</button>
			<%if(request.getAttribute("error") != null){ //If error attrubite exists, alert user to bad user/pw combo
				out.print("<div class=\"error\">Sorry, username or password incorrect</div>");
			} else{
				out.print("<div class=\"error\"></div>");
			}
			%>
		</form>
		<h2>
			<a href='createAccount.jsp'>Create Account</a>
			<br />
			<a href='#'>Forgot Password?</a>
		</h2>
	</section>
</body>
</html>
