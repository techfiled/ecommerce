 <!DOCTYPE html>
   <%@page import="java.sql.*"%>
<html lang="en">
  <head>
    <title>Ultras - Clothing Store eCommerce Store HTML Website Template</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="stylesheet" type="text/css" href="css/normalize.css">
    <link rel="stylesheet" type="text/css" href="icomoon/icomoon.css">
    <link rel="stylesheet" type="text/css" media="all" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/vendor.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- script
    ================================================== -->
    <script src="js/modernizr.js"></script>
  </head>
  <body>

    <div class="preloader-wrapper">
      <div class="preloader">
      </div>
    </div>

    <div class="search-popup">
      <div class="search-popup-container">

        <form role="search" method="get" class="search-form" action="cart_controller">
          <input type="search" id="search-form" class="search-field" placeholder="Type and press enter" value="" name="s" />
          <button type="submit" class="search-submit"><a href="#"><i class="icon icon-search"></i></a></button>
        </form>

        <h5 class="cat-list-title">Browse Categories</h5>
        
        <ul class="cat-list">
          <li class="cat-list-item">
            <a href="shop.html" title="Men Jackets">Men Jackets</a>
          </li>
          <li class="cat-list-item">
            <a href="shop.html" title="Fashion">Fashion</a>
          </li>
          <li class="cat-list-item">
            <a href="shop.html" title="Casual Wears">Casual Wears</a>
          </li>
          <li class="cat-list-item">
            <a href="shop.html" title="Women">Women</a>
          </li>
          <li class="cat-list-item">
            <a href="shop.html" title="Trending">Trending</a>
          </li>
          <li class="cat-list-item">
            <a href="shop.html" title="Hoodie">Hoodie</a>
          </li>
          <li class="cat-list-item">
            <a href="shop.html" title="Kids">Kids</a>
          </li>
        </ul>
      </div>
    </div>
    
  
 

 <section>
 
 <h1> cart product</h1>
  
 
      
          <table  class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th scope="col"> product </th>
                      
                    <th>prod_name</th>
                        <th>prod_price</th>
                            <th>prod_quantity</th>
                            <th>buy product</th>
                           
                
                </tr>
            </thead>
            <tbody >
   <%
                 String sidstr=request.getParameter("pid");
   					
        if (sidstr != null )
        {
		 try
		 {
			
 	        	                              
			   	  Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce1?user=root&password=kannu@8930");
		        	                                  			
		          PreparedStatement ps=conn.prepareStatement("select * from  product where prod_id=?");
		          ps.setString(1,sidstr );
		          ResultSet rs=ps.executeQuery();
		          String totalCost;
					while(rs.next())
					{
							
						  totalCost=rs.getString("prod_price");
						
	%>      <tbody>
  <tr>        
    
                    <div class="product-item col-lg-4 col-md-6 col-sm-6">
                      <div class="image-holder">
                   <td>     <img src="<%="admin/"+rs.getString("file")%>" alt="product" class="product-image"></td>
                        
                      </div>
            
      
                      <div class="product-detail">
                        <h3 class="product-title">
             <td>      <a href="#">"<%=rs.getString("prod_name")%>"</a></td>   
                        </h3>
              <td   class="item-price text-primary"><%=rs.getString("prod_price")%> </td> 
                  <td ><input type="number" placeholder="quantity" name="quantity"></td>
                     <td><button id="buy" onclick="buy_product(<%=rs.getString("prod_id")%>)">buy</button></td>
                     
                       </div>
                    </div>
                                   
                    <tr>
 	 	 

         <th colspan="3">TotalCost:</th>
                <td><%=totalCost%></td> 
                
                </tr> 
					 	
						
	<% 				
	}
		 }
		 catch (Exception e)
				{
				e.printStackTrace(); 
			
				}
                 }
                 else
              {
     %>  
      			<h1>No Product available</h1>         	 		
          	  <% 			   }

 %>	
 
 </tr>  
               
                </tbody>
 </table>
 
 </section>
  
<script>
function buy_product(pid){
    var buy = document.getElementById("buy"); // Corrected variable declaration
    alert("Your order is dispatched "+pid); 
    // Corrected console.log statement
    

}
</script>
  
   
   
<jsp:include page="footer.jsp"/>
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/script.js"></script>
  </body>
</html> 