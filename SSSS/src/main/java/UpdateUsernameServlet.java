import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateUsernameServlet")
public class UpdateUsernameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the new username from the form
        String newUsername = request.getParameter("newUsername");

        // Get the user's ID or some identifier (you should adapt this part based on your application)
        String userID = (String)request.getSession().getAttribute("username");
        String password = (String)request.getSession().getAttribute("password");

        // Database connection details
        String url = "jdbc:mysql://localhost:3306/ssss";
        String user = "root";
        String pass = "Akhil2004@";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, user, pass);

            
            String updateUsernameQuery = "UPDATE UserAccounts SET username = ? WHERE username = ? and userpassword = ?";
            PreparedStatement updateUsernameStatement = connection.prepareStatement(updateUsernameQuery);
            updateUsernameStatement.setString(1, newUsername);
            updateUsernameStatement.setString(2, userID);
            updateUsernameStatement.setString(3, password);

            int rowsAffected = updateUsernameStatement.executeUpdate();

            if (rowsAffected > 0) {
                // Update the session attribute "username" with the new username
                request.getSession().setAttribute("username", newUsername);
                // Redirect to a success page
                response.sendRedirect("Resident.jsp?update=success");
            } else {
                // Redirect to a failure page or provide a failure message
                response.sendRedirect("UpdateUsernameFailure.jsp");
            }

            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Redirect to an error page or provide an error message
            response.sendRedirect("UpdateUsernameError.jsp");
        }
    }
}
