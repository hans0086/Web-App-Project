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
		<h1>Catalog</h1><% 
		//<input type="hidden" value="#" id="searchAnchor" />
		//<input type="text" id="search" name="search" placeholder="Search" /><button type="submit" name="searchSubmit" id="searchSubmit" value="submit" onclick="SearchDB">Search Catalog</button>
		%>
		<a href="shoppingCart.jsp">View Shopping Cart</a>
		<input type="text" id="search" placeholder="Search Database"><button onClick = "searchDB()" id="search">Search</button>
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
		String password = "Mat20134"; // the database password
		//String searchQ =request.getParameter("searchAnchor");
		Connection conn = DriverManager.getConnection(url + dbName, userName, password);
        Statement statement = conn.createStatement();
        ResultSet rs;
       
       // if (searchQ == null){
        	//searchQ = "SELECT productName, productSystem, productInventory, productPrice FROM gaming.products";
       // }
        
        
        rs = statement.executeQuery("SELECT productName, productSystem, productInventory, productPrice FROM gaming.products") ; 
        while(rs.next()){ %>
           <TR class="separating_line">
               <TD> <a href="chosenItem.jsp?val=<%= rs.getString(1) %>" onClick="openPopUp();return false;" id="<%=rs.getString(1)%>"><%=rs.getString(1)%></a> </TD><!--  outputs the entry in the 1st column -->
               <TD> <%=rs.getString(2) %> </TD><!--  outputs the entry in the 2nd column -->
               <TD> <%=rs.getString(3) %> </TD><!--  outputs the entry in the 3rd column -->
               <TD> <%=rs.getString(4) %> </TD><!--  outputs the entry in the 4th column -->
           </TR>        
        <%}
		
		} catch(Exception ex){}
            %>
            </Table>
	</section>
</body>
<script>
function openPopUp(){
	var item = $(this).getAttribute("id");
	
	//window.open("popUp.jsp", "PopUp", "scrollbars=no,resizable=no,width=400,height=280");
    //return false;
}
function searchDB(){
	var query = null;
	if(document.getElementById("search").value == null){
		query = "";
	}
	else if(document.getElementById("search").value != null){
		query = "Select productName,productSystem,productInventory,productPrice FROM gaming.products WHERE productName LIKE '"+document.getElementById("search").value +"%'";
		
	}
	document.getElementById("searchAnchor").setAttribute("value", query);
		
}
window.onload = function() {
    document.getElementById("searchSubmit").onclick = function search() {
        searchDB();
        //validation code to see State field is mandatory.  
    }
}
</script>
}
</html>