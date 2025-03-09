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
     function demovalidation() 
     {
    	    b=true;
    	   
    	    
    	    var userobj = document.getElementById("nameInput");
    	    var selectobj = document.getElementById("items");
    	    if (userobj.value == "") 
    	    {
    	       
    	        userobj.classList.add("is-invalid");
    	        
    	        
    	        document.getElementById('uerr').innerHTML = 'Please enter a name';
    	        b=false;
    	    } 
    	    else
    	    {
    	        
    	        userobj.classList.remove("is-invalid");
    	        
    	        
    	        document.getElementById('uerr').innerHTML = "";
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
                    <h4 class="card-title">subCategory</h4>
                    <form  action="../Subcontroller?name=add" method="post" id="form_sub" >
                   
                    <div class="form-group">
                    <select class="form-select" name="cat_id" id="items" >
   
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
  		 
					 <p class="invalid-feedback" id="serr"></p>
                    </div>
                      <div class="form-group">
                        <input type="text" id="nameInput" class="form-control"  id="exampleInputUsername1" placeholder="Enter subcategory name" name="sub_name">
                             <br>
                <p class="invalid-feedback" id="uerr"></p>
                      </div>
                   
                      <button type="submit"   onclick="return demovalidation()"  id='subbut' class="btn btn-primary me-2">Add Category</button>
                     
                    </form>
                  </div>
                </div>
              </div>
        </div>
              <script>
            			function  editSubcontroller(sid)
            			{
            				//td doc
            				subnametd=document.getElementById("subname"+sid);
            				//alert(catnametd.innerHTML);
            				
            				//input doc
            				subnameinput=document.getElementById("nameInput");
            				subnameinput.value=subnametd.innerHTML;
            				
            				//button docs
            				subbutdoc=document.getElementById("subbut");
            				subbutdoc.innerHTML='Update Category';
            				
            				//form docs
            				form=document.getElementById("form_sub");
            				form.action='../Subcontroller?name=edit&sid='+sid;
            				
            				
          
            				
            			}
            </script>
        <center>
          <table  class="table">
            <thead>
                <tr>
                    <th> sr no. </th>
                      <th> cat_id </th>
                    <th> sub_name </th>
                    <th> Delete </th>
                     <th> Edit </th>
                </tr>
            </thead>
            <tbody >
     <%
    
		 try {
 	        	                              
			   	  Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce1?user=root&password=kannu@8930");
		        	                                  			
		          PreparedStatement ps=conn.prepareStatement("select*from subcategoryy");
		          ResultSet rs=ps.executeQuery();
		          int s=0;
					while(rs.next())
		 	{
						s=s+1;
	%>
	 
					 		 <tr>
				                  
				                    <td><%=rs.getString(1) %></td>
				                       <td  ><%=rs.getString(2) %></td>
				                          <td id="subname<%=rs.getString(1)%>"><%=rs.getString(3) %></td>
				                     <td><a href="../Subcontroller?name=delete&sub_id=<%=rs.getString(1)%>">Delete</a></td>
				                    <td><a href="#" onclick="editSubcontroller(<%=rs.getString(1)%>)">Edit</a></td>
				                    
				                </tr>
			
<%
				}	 
	
		 }
		 catch (Exception e)
				{
				e.printStackTrace(); 
			
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