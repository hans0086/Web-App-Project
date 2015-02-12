<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>
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
		
		<Table>
            	<TR>
               		<TH>Product Name</TH>
               		<TH>Console</TH>
               		<TH>Available Quantity</TH>
               		<TH>Price</TH>

           		</TR>
		<%
		try{

		Class.forName("com.mysql.jdbc.Driver"); 
		String url = "jdbc:mysql://localhost:3306/"; // the location of the database
		String dbName = "gaming"; // the database to execute the query on
		String driver = "com.mysql.jdbc.Driver"; // the database driver used to connect to the database
		String userName = "root"; // the database user name
		String password = "BlackSox2012"; // the database password
		Connection conn = DriverManager.getConnection(url + dbName, userName, password);

        Statement statement = conn.createStatement();
        ResultSet rs = statement.executeQuery("SELECT  productName,productSystem,productInventory,productPrice FROM gaming.products") ; 

        while(rs.next()){ %>
           <TR class="separating_line">
           
               <TD> <%=rs.getString(1) %> </TD>
               
               <TD> <%=rs.getString(2) %> </TD>
               
               <TD> <%=rs.getString(3) %> </TD>
               
               <TD> <%=rs.getString(4) %> </TD>

           </TR>
            
        <%}
		
		} catch(Exception ex){}
            %>
            </Table>
	</section>
	
      
</body>
</html>
