

  
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
import java.sql.SQLException;
 
 

@WebServlet("/validateotp1")
public class validateotp1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		{
			int value=Integer.parseInt(request.getParameter("otp"));
			jakarta.servlet.http.HttpSession session=request.getSession();
			int otp=(int)session.getAttribute("otp");
			
			
			
			jakarta.servlet.RequestDispatcher dispatcher=null;
			
			
			if (value==otp) 
			{
				
					request.setAttribute("email", request.getParameter("email"));
					request.setAttribute("status", "success");
				  dispatcher=request.getRequestDispatcher("admin/changepassword.jsp");
				dispatcher.forward(request, response);
				
			}
			else
			{
				request.setAttribute("message","wrong otp");
				
			   dispatcher=request.getRequestDispatcher("admin/EnterOtp.jsp");
				dispatcher.forward(request, response);
			
			}
			
		}
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
