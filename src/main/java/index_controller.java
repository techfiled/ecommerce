import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
 
public class index_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter(); 
		
		String info=request.getParameter("name");
		if(info!=null)
{
		if(info.equals("add"))
		{
			
			String name=request.getParameter("cat_name");
			 try {
	 	        	                              
				  
				 Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce1?" + "user=root&password=kannu@8930");	                                  			
			          PreparedStatement ps=conn.prepareStatement("insert into category (cat_name)value(?)");
						 ps.setString(1, name);
						 
						 int res=ps.executeUpdate();
						 
									 if(res>0)		
									 {
										 response.sendRedirect("admin/index.jsp"); 			
									 }     
									 else
									 {
										 response.sendRedirect("admin/index.jsp"); 	
										 
									 }
									 
								
									 }
											 catch (Exception e)
								 				{
													e.printStackTrace(); 
												
								 				}	
			
		}
		else if (info.equals("delete"))
		{
			String cidstr=request.getParameter("cid");
			 try {
	 	        	                              
				  
				 Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce1?" + "user=root&password=kannu@8930");	                                  			
			          PreparedStatement ps=conn.prepareStatement("delete from category where cat_id=?");
						 ps.setString(1, cidstr);
						 
						 int res=ps.executeUpdate();
									 
									 if(res>0)		
									 {
										 response.sendRedirect("admin/index.jsp"); 		
									 }     
									 else
									 {
										 response.sendRedirect("admin/index.jsp"); 	
										 
									 }
									 
					
						 }
						 catch (Exception e)
			 				{
								e.printStackTrace(); 
							
			 				}
		}
		else if(info.equals("edit"))
		{
			out.print("hello");
			String cidstr=request.getParameter("cid");
			String catnamestr=request.getParameter("cat_name");
			 try {
	 	        	                              
				  
				 Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce1?" + "user=root&password=kannu@8930");	                                  			
			          PreparedStatement ps=conn.prepareStatement("update  category set cat_name=? where cat_id=?");
						 ps.setString(1, catnamestr);
						 ps.setString(2, cidstr);
						 int res=ps.executeUpdate();
									 
									 if(res>0)		
									 {
										 response.sendRedirect("admin/index.jsp"); 		
									 }     
									 else
									 {
										 response.sendRedirect("admin/index.jsp"); 	
										 
									 }
									 
					
						 }
						 catch (Exception e)
			 				{
								e.printStackTrace(); 
							
			 				}
		}
		
		
 
}
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
