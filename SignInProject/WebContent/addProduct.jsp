<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product</title>
</head>
<body>
    <section>
        <span></span>
        <h1>Add Product</h1>
        <!-- Form to allow for the creation of a use account -->
        <form action="addItemServlet" method="post">
            <input type="text" name="productName" class="pName" required="required" placeholder="Product Name" />
            <div class="status"></div> <!-- Used by AJAX function to show loader gif -->
            <input type="text" name="productSystem" required="required" placeholder="Product System" />
            <input type="text" name="productInventory" required="required" placeholder="Inventory" />
            <input type="text" name="productPrice" required="required" placeholder="Price" />
            <button type="submit" value="Create Account">ADD TO PRODUCT LIST</button>
        </form>
    </section>
</body>

<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">  
 <!-- AJAX Function to check if the username is already in use. THIS FUNCTION IS NOT FUNCTIONAL YET -->
          $(document).ready(function(){
              $(".uname").change(function(){
                  var uname = $(this).val();
                  if(uname.length >= 3){  
                      $(".status").html("<img src='./img/loader.gif'>"); // Show the loader .gif
                       $.ajax({ // Make the AJAX call
                          type: "POST",  
                          url: "check",  
                          data: "username="+ uname,  
                          success: function(msg){
                              $(".status").ajaxComplete(function(event, request, settings){  
                                  $(".status").html(msg);  
                              });  
                          }  
                      });   
                  }  
                  else{  
                      $(".status").html("<font color=red>Username too short</font>"); // Otherwise alt
                  }    
              });  
          });  
    </script>
</html>