<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item">
              <a class="nav-link" href="index.jsp">
                <i class="mdi mdi-grid-large menu-icon"></i>
                <span class="menu-title">category</span>
              </a>
            </li>
             <li class="nav-item">
              <a class="nav-link" href="Subcategory.jsp">
                <i class="mdi mdi-grid-large menu-icon"></i>
                <span class="menu-title">Subcategory</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link"   href="product.jsp" >
                <i class="menu-icon mdi mdi-floor-plan"></i>
                <span class="menu-title">product</span>
               
              </a>
               
            </li>
            <li class="nav-item">
              <a class="nav-link"  href="password.jsp" >
                <i class="menu-icon mdi mdi-card-text-outline"></i>
                <span class="menu-title">change password</span>
                 
              </a>
              
              
            <li class="nav-item">
              <a class="nav-link"  href="log.jsp" aria-expanded="false" aria-controls="auth">
                <i class="menu-icon mdi mdi-account-circle-outline"></i>
                <span class="menu-title">log out</span>
                
              </a>
              <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
                 <li>  <form action="../logout_controller" method="get">
                <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i><input type="submit" value="log out" /></p></a>
             </form>
                </ul>
              </div>
            </li>
           
          </ul>
        </nav>