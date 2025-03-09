



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
 @WebServlet("/product_controller")
 @MultipartConfig

public class product_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter(); 
		String select=request.getParameter("cat_id");
		String select2=request.getParameter("sub_id");
		String name=request.getParameter("prod_name");
		String price=request.getParameter("prod_price");
		String quantity=request.getParameter("prod_quantity");
		  Part file=request.getPart("fileu");
   		out.println("fsdf"+name+"fsfs"+price);

		
		 try {
 	        	                              
			   Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce1?" + "user=root&password=kannu@8930");
		        
		          
		 String  info=request.getParameter("name") ; 
		 if(info !=null)
		 {
		          
		       if(info.equals("add"))   
		       {
		    	 
		    	   
		    	  // Part file=request.getPart("fileu");
		    	   String imageFileName=file.getSubmittedFileName();
		    	   
		   		String uploadPath="C://Users//KAJAL RANA//Dropbox//Desktop//Project//secommerce1//src//main//webapp//admin//upload//"+imageFileName;  // upload path where we have to upload our actual image
		          
		   		try
				{
				
				FileOutputStream fos=new FileOutputStream(uploadPath);
				InputStream is=file.getInputStream();
				
				byte[] data=new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
				
				}
				
				catch(Exception e)
				{
					e.printStackTrace();
				}
		   		
		   		PreparedStatement ps=conn.prepareStatement("insert into  product(cat_id,sub_id,prod_name,prod_price,prod_quantity,file)value(?,?,?,?,?,?)");
					 ps.setString(1,select);
					 ps.setString(2,select2);
					 ps.setString(3,name);
					 ps.setString(4,price);
					 ps.setString(5,quantity);
					 ps.setString(6, "upload/"+imageFileName);
					 
					 
					 int res=ps.executeUpdate();
					 if(res>0)		
					 {
						 response.sendRedirect("admin/product.jsp"); 		
					 }     
					 else
					 {
						 response.sendRedirect("admin/product.jsp"); 	
						 
					 }
		       }	
		 
		 
		       
					 else if (info.equals("delete"))
						{
							String cidstr=request.getParameter("pid");
						                                 			
							          PreparedStatement ps=conn.prepareStatement("delete from product where prod_id=?");
										 ps.setString(1, cidstr);
										 
										 int res=ps.executeUpdate();
										 
										 if(res>0)		
										 {
											 response.sendRedirect("admin/product.jsp"); 		
										 }     
										 else
										 {
											 response.sendRedirect("admin/product.jsp"); 	
											 
										 }
										 
									
										 } 

		       
					 else if (info.equals("edit"))
						{
						 
							 
						 out.print("hello");
						 String pid = request.getParameter("pid");
						 String prod_name = request.getParameter("prod_name");
						 String prod_price = request.getParameter("prod_price");
						 String prod_quantity = request.getParameter("prod_quantity");

						 PreparedStatement ps = conn.prepareStatement("UPDATE product SET prod_name=?, prod_price=?, prod_quantity=? WHERE prod_id=?");
						
						 ps.setString(1, prod_name);
						 ps.setString(2, prod_price);
						 ps.setString(3, prod_quantity);
						  ps.setString(4, pid);

						 int res = ps.executeUpdate();

										 
										 if(res>0)		
										 {
											 response.sendRedirect("admin/product.jsp"); 		
										 }     
										 else
										 {
											 response.sendRedirect("admin/product.jsp"); 	
											 
										 }
										 
									
										 } 
					 
		       
		 
	}
		 }
					 catch (Exception e)
		 				{
							e.printStackTrace(); 
						
		 				}
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
