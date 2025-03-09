

 
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

 
public class Subcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter(); 
		String select=request.getParameter("cat_id");
		String name=request.getParameter("sub_name");
		 try {
 	        	                              
			   Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce1?" + "user=root&password=kannu@8930");
		        	 
		      	String info=request.getParameter("name");
	if(info!=null)
		{
				if(info.equals("add"))
				{
		          PreparedStatement ps=conn.prepareStatement("insert into  subcategoryy(cat_id,sub_name)value(?,?)");
					 ps.setString(1,select);
					 ps.setString(2,name);
					 
					 
					 
					 int res=ps.executeUpdate();
					 if(res>0)		
					 {

						 response.sendRedirect("admin/Subcategory.jsp"); 	
					 }     
					 else
					 {
						 response.sendRedirect("admin/Subcategory.jsp"); 	
						 
					 }
					 
				
					 }
		
	else if (info.equals("delete"))
	{
		String cidstr=request.getParameter("sub_id");
	                                   			
		          PreparedStatement ps=conn.prepareStatement("delete from subcategoryy where sub_id=?");
					 ps.setString(1, cidstr);
					 
					 int res=ps.executeUpdate();
					 
					 if(res>0)		
					 {
						 response.sendRedirect("admin/Subcategory.jsp"); 		
					 }     
					 else
					 {
						 response.sendRedirect("admin/Subcategory.jsp"); 	
						 
					 }
					 
				
					 }
	
				
	else if (info.equals("edit"))
	{
				out.print("hello");
		 
		 
		String sidstr=request.getParameter("sid");
		String subnamestr=request.getParameter("sub_name");   
		
		          PreparedStatement ps=conn.prepareStatement("update subcategoryy set sub_name=? where sub_id=?");
					 ps.setString(1, subnamestr.trim());

				 ps.setString(2, sidstr);
					 
					 int res=ps.executeUpdate();
					 
					 if(res>0)		
					 {
						 response.sendRedirect("admin/Subcategory.jsp"); 		
					 }     
					 else
					 {
						 response.sendRedirect("admin/Subcategory.jsp"); 	
						 
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
