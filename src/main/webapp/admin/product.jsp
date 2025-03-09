<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="java.sql.*"%>
  <%
 	if(session!=null)
 	{
 				String name=(String)session.getAttribute("myloginses");
 				 if(name==null)
				 {
 					    //out.print("fsdf"+name);
					 	response.sendRedirect("log.jsp");
					 	
				 }		
 	}
 			
%>
 
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Category </title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="assets/vendors/feather/feather.css">
    <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="assets/vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendors/typicons/typicons.css">
    <link rel="stylesheet" href="assets/vendors/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="assets/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="assets/js/select.dataTables.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="assets/images/favicon.png" />
        <script>
        function demovalidation() {
            var b = true;
            
            var userobj = document.getElementById("nameInput");
            var priceobj = document.getElementById("input_price");
            var quantityobj = document.getElementById("input_quantity");
            var fobj = document.getElementById("file");
            
            if (userobj.value == "") {
                userobj.classList.add("is-invalid");
                document.getElementById('uerr').innerHTML = 'Please enter a product name';
                b = false;
            } else {
                userobj.classList.remove("is-invalid");
                document.getElementById('uerr').innerHTML = "";
            }

            if (priceobj.value == "") {
                priceobj.classList.add("is-invalid");
                document.getElementById('perr').innerHTML = 'Please enter a product price';
                b = false;
            } else {
                priceobj.classList.remove("is-invalid");
                document.getElementById('perr').innerHTML = "";
            }
		
            if ( quantityobj.value == "") {
            	quantityobj.classList.add("is-invalid");
                document.getElementById('qerr').innerHTML = 'Please enter a product quantity';
                b = false;
            } else {
            	quantityobj.classList.remove("is-invalid");
                document.getElementById('qerr').innerHTML = "";
            }
            
            if ( fobj.value == "") {
            	fobj.classList.add("is-invalid");
                document.getElementById('ferr').innerHTML = 'Please choose a file';
                b = false;
            } else {
            	quantityobj.classList.remove("is-invalid");
                document.getElementById('ferr').innerHTML = "";
            }
            return b;
        }


    </script>
  </head>
  <body class="with-welcome-text">
    <div class="container-scroller">
      <div class="row p-0 m-0 proBanner" id="proBanner">
        <div class="col-md-12 p-0 m-0">
          <div class="card-body card-body-padding px-3 d-flex align-items-center justify-content-between">
            <div class="ps-lg-3">
              <div class="d-flex align-items-center justify-content-between">
                <p class="mb-0 fw-medium me-3 buy-now-text">Free 24/7 customer support, updates, and more with this template!</p>
                <a href="https://www.bootstrapdash.com/product/star-admin-pro/" target="_blank" class="btn me-2 buy-now-btn border-0">Buy Now</a>
              </div>
            </div>
            <div class="d-flex align-items-center justify-content-between">
              <a href="https://www.bootstrapdash.com/product/star-admin-pro/"><i class="ti-home me-3 text-white"></i></a>
              <button id="bannerClose" class="btn border-0 p-0">
                <i class="ti-close text-white"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- partial:partials/_navbar.html -->
 <jsp:include page="nav.jsp"/>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        
         <jsp:include page="sidenav.jsp"/>
         
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
          
           <div class='row'>
         		<div class="col-md-6 grid-margin stretch-card mx-auto">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">product</h4>
                    <form action="../product_controller?name=add" method="post" id="formprod"  enctype="multipart/form-data">
                      <div class="form-group">
                       <select  class="form-select" name="cat_id">
						 
					                    
					   
					<% 
					    try {
					        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
					        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce1?user=root&password=kannu@8930");
					        PreparedStatement ps = conn.prepareStatement("select * from category");
					        ResultSet rs = ps.executeQuery();
					        
					        while(rs.next()) {
					%>
					            <option value="<%= rs.getString(1) %>"><%= rs.getString(2) %></option>
					<%
					        }
					    } catch (Exception e) {
					        e.printStackTrace(); 
					    }
					%>
					 
						        </select>
											</div>
											<div class="form-group">
											 <select class="form-select" name="sub_id">
											   
											                   
						   
						<% 
						    try {
						        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
						        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce1?user=root&password=kannu@8930");
						        PreparedStatement ps = conn.prepareStatement("select * from  subcategoryy");
						        ResultSet rs = ps.executeQuery();
						        
						        while(rs.next()) {
						%>
						            <option value="<%= rs.getString(1) %>"><%= rs.getString(3) %></option>
						<%
						        }
						    } catch (Exception e) {
						        e.printStackTrace(); 
						    }
						%>
						</select>
					</div>
					<div class="form-group">
                       
                       
                        <input type="text"  id="nameInput" class="form-control"   id="exampleInputUsername1" placeholder="Enter product name" name="prod_name">
                                 <br>
                <p class="invalid-feedback" id="uerr"></p>
                        </div>
                       <div class="form-group">
                           
                           <input type="text"  id="input_price" class="form-control" id="exampleInputUsername1" placeholder="Enter product price" name="prod_price">
                                              <br>
                <p class="invalid-feedback" id="perr"></p>
                              </div>
                         <div class="form-group"> 
                              
                              <input type="number"  id="input_quantity"  class="form-control" id="exampleInputUsername1" placeholder="Enter quantity" name="prod_price">
                                                            <br>
                <p class="invalid-feedback" id="qerr"></p>
                              </div>
                           <div class="form-group">      
                                 <textarea class="form-control" name="description" rows="4" cols="50" id="exampleInputUsername1" placeholder="">
                                   </textarea> </div>
                                <div class="form-group">  
                                    <input type="file" id="file" class="form-control" name="fileu" id="exampleInputUsername1" placeholder="select file">
                     			         <br>
               						 <p class="invalid-feedback" id="ferr"></p>
                     			 </div>
                   
                      <button type="submit"  onclick="return demovalidation()" class="btn btn-primary me-2"  id='prodbut'>Add Category</button>
                     
                    </form>
                  </div>
                </div>
              </div>
         </div>
          
          </div>
          <script >
        function  editCategory(pid)
        {
        prodnametd=document.getElementById("prodname"+pid);
        
        
		        prodpricetd=document.getElementById("prodprice"+pid);
		      
		        
			        prodquantitytd=document.getElementById("prodquantity"+pid);
			        
			        //name
			    	prodnameinput=document.getElementById("nameInput");
			    	
			    	
		prodnameinput.value=prodnametd.innerHTML;
		//price
		 	prodpriceinput=document.getElementById("input_price");
		prodpriceinput.value=prodpricetd.innerHTML;
		//quantity
		prodquantityinput=document.getElementById("input_quantity");
		prodquantityinput.value=prodquantitytd.innerHTML;
		prodbutdoc=document.getElementById("prodbut");
		prodbutdoc.innerHTML='Update Category';
		formcat=document.getElementById("formprod");
		  formcat.enctype = 'multipart/form-data';
		formcat.action='../product_controller?name=edit&pid='+pid;
		
		 
        }
        </script>
         
          
                    <center>
          <table  class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th scope="col"> sr no. </th>
                      <th> cat_id </th>
                    <th> sub_id </th>
                    <th>prod_name</th>
                        <th>prod_price</th>
                            <th>prod_quantity</th>
                            <th>image</th>
                    <th  > Delete </th>
                     <th  > Edit </th>
                </tr>
            </thead>
            <tbody >
    <%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce1?user=root&password=kannu@8930");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM product");
        ResultSet rs = ps.executeQuery();
        int s = 0;
        
        while (rs.next()) {
            s++;
%>
            <tr>
                <td><%= rs.getString(1) %></td> <!-- prod_id -->
                <td><%= rs.getString(2) %></td> <!-- cat_id -->
                <td><%= rs.getString(3) %></td> <!-- sub_id -->
                <td id="prodname<%= rs.getString(1) %>"><%= rs.getString(4) %></td> <!-- prod_name -->
                <td id="prodprice<%= rs.getString(1) %>"><%= rs.getString(5) %></td> <!-- prod_price -->
                <td id="prodquantity<%= rs.getString(1) %>"><%= rs.getString(6) %></td> <!-- prod_quantity -->
                <td id="file<%= rs.getString(1) %>"><img src="<%= rs.getString("file") %>" alt="Product Image"></td>
                <td><a href="../product_controller?name=delete&pid=<%= rs.getString(1) %>">Delete</a></td>
                <td><a href="#" onclick="editCategory(<%= rs.getString(1) %>)">Edit</a></td>
            </tr>
<%
        }
        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>
     
     </center>
            </tbody>
        </table>
      
        
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <jsp:include page="footer.jsp"/>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/vendors/chart.js/chart.umd.js"></script>
    <script src="assets/vendors/progressbar.js/progressbar.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/template.js"></script>
    <script src="assets/js/settings.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="assets/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="assets/js/dashboard.js"></script>
    <!-- <script src="assets/js/Chart.roundedBarCharts.js"></script> -->
    <!-- End custom js for this page-->
  </body>
</html>