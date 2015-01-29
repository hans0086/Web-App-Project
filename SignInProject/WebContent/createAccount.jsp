<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Account</title>
</head>
<body>
    <section>
        <span></span>
        <h1>Create User Account</h1>
        <!-- Form to allow for the creation of a use account -->
        <form action="createAccountServlet" method="post">
            <input type="text" name="username" class="uname" required="required" placeholder="User Name" />
            <div class="status"></div> <!-- Used by AJAX function to show loader gif -->
            <input type="password" name="userpass" required="required" placeholder="Password" />
            <input type="text" name="userFirstName" required="required" placeholder="First Name" />
            <input type="text" name="userLastName" required="required" placeholder="Last Name" />
            <input type="text" name="userAddress" required="required" placeholder="Address" />
            <input type="text" name="userCity" required="required" placeholder="City" />
            <input type="text" name="userCountry" required="required" placeholder="Country" />
            <input type="text" name="userPostalCode" required="required" placeholder="Postal Code" />
            <input type="text" name="userEmail" required="required" placeholder="Email" />
            <input type="text" name="userPhone" required="required" placeholder="Phone Number" />
            <button type="submit" value="Create Account">CREATE ACCOUNT</button>
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
