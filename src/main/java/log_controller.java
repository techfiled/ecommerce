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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/log_controller")
public class log_controller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 PrintWriter out = response.getWriter();
         String email = request.getParameter("email");
         String pass = request.getParameter("password");

         if (email.equals("") || pass.equals(" ")) {
             response.sendRedirect("admin/log.jsp");
         } else {
             // Validate login credentials against database
             try {
             			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
    	          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce1?" + "user=root&password=kannu@8930");

                 // Query to check credentials
                 String sql = "SELECT * FROM login WHERE email = ? AND password = ?";
                 PreparedStatement ps = conn.prepareStatement(sql);
                 ps.setString(1, email);
                 ps.setString(2, pass);

                 ResultSet rs = ps.executeQuery();

                 if (rs.next()) { 
                 	 
                 	
                     HttpSession session = request.getSession();
                     session.setAttribute("myloginses", email);

                     // Redirect to success page
                     response.sendRedirect("admin/index.jsp");
                 }
                 else 
                 {  
                 	// User not found in database
                     response.sendRedirect("admin/log.jsp");
                 }

                 // Close resources
                 rs.close();
                 ps.close();
                 conn.close();
                 
             } catch (ClassNotFoundException | SQLException e) {
                 e.printStackTrace();
                 response.sendRedirect("admin/log.jsp");
             } catch (InstantiationException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			} catch (IllegalAccessException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}
         }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
