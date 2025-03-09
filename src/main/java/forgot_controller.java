import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@WebServlet("/forgot_controller")
public class forgot_controller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");

        int otpvalue = 0;

        HttpSession mySession = request.getSession();

        if (email != null && !email.equals("")) {
            // Generate OTP
            Random rand = new Random();
            otpvalue = rand.nextInt(999999); // Generate a 6-digit OTP

            String to = email; // Recipient's email address

            // SMTP properties
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "465");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.ssl.enable", "true");

            // Session with authentication
            Session session = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("kannurana025@gmail.com", "mbsu nwwp ywcy ynta");
                }
            });

            try {
                // Create MimeMessage
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress("kannurana025@gmail.com")); // Set sender's email address
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); // Set recipient's email address
                message.setSubject("Password Reset OTP");
                message.setText("Your OTP for password reset is: " + otpvalue);

                // Send message
                Transport.send(message);
                System.out.println("Message sent successfully");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/EnterOtp.jsp");
            request.setAttribute("message", "OTP is sent to your email id");
            mySession.setAttribute("otp", otpvalue);
            mySession.setAttribute("email", email);
            dispatcher.forward(request, response);
            
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
