<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.labels.text" />
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
		<form action="loginServlet" method="post">
		<fmt:message key="login.label.username" var="usernameLang" /> <!-- pulls the value of the username language key -->
		<input type="text" name="username" required="required" placeholder="${usernameLang}" />
		<fmt:message key="login.label.password" var="passwordLang" /><!-- pulls the value of the password language key -->
		<input type="password" name="userpass" required="required" placeholder="${passwordLang}" />
	    <fmt:message key="login.label.loginB" var="loginButton" /><!--  pulls the value of the login button language key -->
		<button type="submit" value="${loginButton}" >${loginButton}</button>
		<input type="hidden" id="hiddenLang" value="${language}" />
			<%if(request.getAttribute("error") != null){ //If error attrubite exists, alert user to bad user/pw combo
				out.print("<div class=\"error\">Sorry, username or password incorrect</div>");
			} else{
				out.print("<div class=\"error\"></div>");
			}
			%>
		</form>
		<h2>
			<fmt:message key="login.label.createAccount" var="createAcc" />
			<a href='createAccount.jsp'>${createAcc}</a>
			<br />
			<fmt:message key="login.label.forgotPass" var="forgotPass" />
			<a href='#'>${forgotPass}</a>
			<br /><br />
			<fmt:message key="login.label.selectLang" var="Lang" />${Lang}&nbsp;
			<select id="language" name="language">
                <option value="en" ${language == 'en' ? 'selected' : ''}>English</option> <!--  Selects English as the Language for the page -->
                <option value="fr" ${language == 'fr' ? 'selected' : ''}>Français</option> <!--  Selects French as the Language for the page -->
            </select>
		</h2>
	</section>
</body>

<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">  
	$(function () {
		$("#language").change(function (){
			var selected;
			selected = $('#language').find(":selected").val();
			if(selected === 'fr'){<%session.setAttribute("language", "fr");%> alert("Changing to French...");}//changes the language session variable to french
			else if(selected === 'en') {<%session.setAttribute("language", "en");%> alert("Changing to English...");}//changes the language session variable to english
			location.reload();//reloads the page with the desired language
		});
	});
</script>
<script>
</script>
</html>