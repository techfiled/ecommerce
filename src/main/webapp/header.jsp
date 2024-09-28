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

        <form role="search" method="get" class="search-form" action="">
          <input type="search" id="search-form" class="search-field" placeholder="Type and press enter" value="" name="s" />
          <button type="submit" class="search-submit"><a href="#"><i class="icon icon-search"></i></a></button>
        </form>

        <h5 class="cat-list-title">Browse Categories</h5>
        
        <ul class="cat-list">
          <li class="cat-list-item">
            <a href="shop.jsp" title="Men Jackets">Men Jackets</a>
          </li>
          <li class="cat-list-item">
            <a href="shop.jsp" title="Fashion">Fashion</a>
          </li>
          <li class="cat-list-item">
            <a href="shop.jsp" title="Casual Wears">Casual Wears</a>
          </li>
          <li class="cat-list-item">
            <a href="shop.jsp" title="Women">Women</a>
          </li>
          <li class="cat-list-item">
            <a href="shop.jsp" title="Trending">Trending</a>
          </li>
          <li class="cat-list-item">
            <a href="shop.jsp" title="Hoodie">Hoodie</a>
          </li>
          <li class="cat-list-item">
            <a href="shop.jsp" title="Kids">Kids</a>
          </li>
        </ul>
      </div>
    </div>
    <header id="header">
      <div id="header-wrap">
        <nav class="secondary-nav border-bottom">
          <div class="container">
            <div class="row d-flex align-items-center">
              <div class="col-md-4 header-contact">
                <p>Let's talk! <strong>+57 444 11 00 35</strong>
                </p>
              </div>
              <div class="col-md-4 shipping-purchase text-center">
                <p>Free shipping on a purchase value of $200</p>
              </div>
              <div class="col-md-4 col-sm-12 user-items">
                <ul class="d-flex justify-content-end list-unstyled">
                  <li>
                    <a href="login.html">
                      <i class="icon icon-user"></i>
                    </a>
                  </li>
                  <li>
                    <a href="cart.jsp">
                      <i class="icon icon-shopping-cart"></i>
                     
                    </a>
                  </li>
                  <li>
                    <a href="wishlist.html">
                      <i class="icon icon-heart"></i>
                    </a>
                  </li>
                  <li class="user-items search-item pe-3">
                    <a href="#" class="search-button">
                      <i class="icon icon-search"></i>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </nav>
        <nav class="primary-nav padding-small">
          <div class="container">
            <div class="row d-flex align-items-center">
              <div class="col-lg-2 col-md-2">
                <div class="main-logo">
                  <a href="index.html">
                    <img src="images/main-logo.png" alt="logo">
                  </a>
                </div>
              </div>
              <div class="col-lg-10 col-md-10">
                <div class="navbar">

                  <div id="main-nav" class="stellarnav d-flex justify-content-end right">
                    <ul class="menu-list">

                      <li class="menu-item has-sub">
                        <a href="index.jsp" class="item-anchor active d-flex align-item-center" data-effect="Home">Home</i></a>
                      
                      </li>

       <%
    
		 try {
 	        	                              
			   	  Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce1?user=root&password=kannu@8930");
		        	                                  			
		          PreparedStatement ps=conn.prepareStatement("select*from  category");
		          ResultSet rs=ps.executeQuery();
		          int s=0;
					while(rs.next())
					{
						s=s+1;
	 %>
	 
	 
						
	
                      <li class="menu-item has-sub">
                        <a href="shop.jsp" class="item-anchor d-flex align-item-center" data-effect="Shop"><%=rs.getString("cat_name") %><i class="icon icon-chevron-down"></i></a>
  			   <ul class="submenu">
    <%   	                                  			
		          PreparedStatement pssub=conn.prepareStatement("select * from  subcategoryy where cat_id=?");
		          pssub.setString(1,rs.getString(1));
		          ResultSet rs2=pssub.executeQuery();
		         
					while(rs2.next())
					{ 
 %>                
                     
                          <li><a href="shop1.jsp?sid=<%=rs2.getString("sub_id") %>" class="item-anchor"><%=rs2.getString("sub_name") %></a></li>
                       
                     
                     
      <% 		
					}
		%>			
					   </ul>
			</li>	
      <%
      }
		 }
		 catch (Exception e)
				{
				e.printStackTrace(); 
			
				}



     %>               
      
                        <li><a href="index.jsp" class="item-anchor" data-effect="About">About</a></li>
                   

                      <li><a href="contact.html" class="item-anchor" data-effect="Contact">Contact</a></li>

                    </ul>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </nav>
      </div>
    </header>

