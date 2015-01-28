<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Account</title>
</head>
<body>
	<form action="createAccountServlet" method="post">

		<fieldset style="width: 300px">

			<legend>Create a User Account</legend>

			<table>
				<tr>
					<td>User Name</td>
					<td><input type="text" name="username" required="required" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="userpass" required="required" /></td>
				</tr>
				<tr>
					<td>First Name</td>
					<td><input type="text" name="userFirstName"	required="required" /></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" name="userLastName" required="required" /></td>
				</tr>
				<tr>
					<td>Address</td>
					<td><input type="text" name="userAddress" required="required" /></td>
				</tr>
				<tr>
					<td>City</td>
					<td><input type="text" name="userCity" required="required" /></td>
				</tr>
				<tr>
					<td>Country</td>
					<td><input type="text" name="userCountry" required="required" /></td>
				</tr>
				<tr>
					<td>Postal Code</td>
					<td><input type="text" name="userPostalCode" required="required" /></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="text" name="userEmail" required="required" /></td>
				</tr>
				<tr>
					<td>Phone Number</td>
					<td><input type="text" name="userPhone" required="required" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Login" /></td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
