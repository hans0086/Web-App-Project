<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import=" java.sql.*" %>
<html>
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Store</title>
</head>
<body>
	<section>
		<span></span>
		<h1>Catalog</h1>
		
		<Table border = 1>
            	<TR>
               		<TH>Product Name</TH>
               		<TH>Console</TH>
               		<TH>Amount Available</TH>
               		<TH>Price</TH>

           		</TR>
		<%
		try{
		Class.forName("com.mysql.Jdbc.Driver"); 
		String url = "jdbc:mysql://localhost:3306/"; // the location of the database
		String dbName = "gaming"; // the database to execute the query on
		String driver = "com.mysql.jdbc.Driver"; // the database driver used to connect to the database
		String userName = "root"; // the database user name
		String password = "BlackSox2012"; // the database password
		Connection conn = DriverManager.getConnection(url + dbName, userName, password);

            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("SELECT productName,productSystem,productInventory,productPrice FROM gaming.products") ; 

            while(rs.next()){
            %>
           <TR>
               <TD> <%rs.getString("productName"); %> </TD>
               <TD> <%rs.getString("productSystem"); %> </TD>
               <TD> <%rs.getString("productInventory"); %> </TD>
               <TD> <%rs.getString("productPrice"); %> </TD>
               <TD> TEST</TD>

           </TR>
            
            <%}
		}
            catch(Exception ex){}
            %>
            </Table>
	</section>
	<BR>
      
</body>
</html>
