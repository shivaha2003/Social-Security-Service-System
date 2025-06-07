import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/SupervisoroutServlet")
public class SupervisoroutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Do not create a new session if it doesn't exist

        if (session != null) {
            session.invalidate(); // Invalidate the session to log the user out
        }

        // Redirect to the login page or any other page as needed after logging out
        response.sendRedirect("ssss.html");
    }
}