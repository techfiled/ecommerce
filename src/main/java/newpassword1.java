

  import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

 
 
public class newpassword1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 {

				HttpSession session = request.getSession();
	String newPassword = request.getParameter("password");
	String confPassword = request.getParameter("confPassword");
	jakarta.servlet.RequestDispatcher dispatcher = null;
	if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

		try {
			 Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
	          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce1?" + "user=root&password=kannu@8930");
	        	  
			PreparedStatement pst = conn.prepareStatement("update login set password = ? where email = ? ");
			pst.setString(1, newPassword);
			pst.setString(2, (String) session.getAttribute("email"));

			int rowCount = pst.executeUpdate();
			if (rowCount > 0)
			{
				 
				dispatcher = request.getRequestDispatcher("admin/log.jsp");
			} else {
			 
				dispatcher = request.getRequestDispatcher("admin/changepassword.jsp");
			}
			dispatcher.forward(request, response);
		} catch (Exception e) {
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
