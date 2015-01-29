<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        <form action="createAccountServlet" method="post">
            <input type="text" name="username" class="uname" required="required" placeholder="User Name" />
            <div class="status"></div>
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
          $(document).ready(function(){
              $(".uname").change(function(){
                  var uname = $(this).val();
                  if(uname.length >= 3){  
                      $(".status").html("<img src='./img/loader.gif'>");  
                       $.ajax({  
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
                      $(".status").html("<font color=red>Username too short</font>");
                  }    
              });  
          });  
    </script>
</html>
