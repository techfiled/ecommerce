 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="loginassets/css/bootstrap.min.css" rel="stylesheet">
    <link href="loginassets/css/font-awesome.min.css" rel="stylesheet">
    <link href="loginassets/css/style.css" rel="stylesheet">

    <title>Bootstrap 5  Login Page Design</title>
    <script>
    
    	function demovalidation() {
    	    var userobj = document.getElementById("input_email");
    	    var priceobj = document.getElementById("input_pass");
    	    var uerrobj = document.getElementById("uerr"); // Assuming uerr is the ID for error message display

    	    var b =true;

    	    // Validate email
    	    if(userobj.value.trim() === "") {
    	        uerrobj.innerHTML = 'Please enter email';
    	        uerrobj.style.color = 'red'; 
    	        userobj.style.border = '2px solid steelblue';  
    	        b = false;
    	    } else {
    	        uerrobj.innerHTML = "";
    	        userobj.style.border = '';  
    	    }

    	    // Validate password
    	    if(priceobj.value.trim() === "") {
    	        document.getElementById('perr').innerHTML = 'Please enter password';
    	        document.getElementById('perr').style.color = 'red';  
    	        priceobj.style.border = '2px solid steelblue';  
    	        b = false;
    	    } else {
    	        document.getElementById('perr').innerHTML = "";
    	        priceobj.style.border = '';  
    	    }

    	    return b;
    	}


    </script>
  </head>
  <body>
    <section class="form-01-main" >
      <div class="form-cover">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="form-sub-main">
              <div class="_main_head_as">
                <a>
                  <img src="loginassets/images/vector.png">
                </a>
              </div>
              <form action="../log_controller" method="post">
              
              <div class="form-group" >
                <input id="input_email" id="email" class="form-control _ge_de_ol" type="email" placeholder="Enter Email"  required="  "  aria-required="true"  name="email">
             <p id="uerr"></p>
              </div>
              <div class="form-group">                                              
                <input id="password" type="password" id="input_pass" class="form-control"   placeholder="********" required="required"  name="password">
                <p id="perr"></p>
                <i toggle="password" class="fa fa-fw fa-eye toggle-password field-icon"></i>
              </div>

              <div class="form-group">
                <div class="check_box_main">
                  <a  href="password.jsp">Forgot Password</a>
                </div>
              </div>

              <div class="form-group mt-5">
               	<button  type="submit" class="btn"  onclick="return demovalidation()" >Login</button>
                </div>
              
              </form> 
              </div>
            </div>
          </div>
        </div>
      </div>
    
    </section>
  </body>
</html>