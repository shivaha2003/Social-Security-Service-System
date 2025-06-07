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

@WebServlet("/AddStaffDetailsServlet")
public class AddStaffDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    String url = "jdbc:mysql://localhost:3306/ssss";
    String username = "root";
    String password = "Akhil2004@";


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String staffFullName = request.getParameter("StaffFullName");
        String role = request.getParameter("Role");
        String contactPhone = request.getParameter("ContactPhone");

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Create a database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url,username,password);

            // Prepare and execute an SQL statement to insert staff details
            String insertQuery = "INSERT INTO StaffInfo (StaffFullName, Role, ContactPhone) VALUES (?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, staffFullName);
            preparedStatement.setString(2, role);
            preparedStatement.setString(3, contactPhone);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                // Insertion was successful
                response.sendRedirect("AddStaffDetails.jsp?add=success");
            } else {
                // Insertion failed
                response.sendRedirect("your-error-page.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions and errors
            response.sendRedirect("your-error-page.jsp");
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
