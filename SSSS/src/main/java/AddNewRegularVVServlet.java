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

@WebServlet("/AddNewRegularVVServlet")
public class AddNewRegularVVServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String buildingName = request.getParameter("StaffFullName");
        String numFlatsperFloorStr = request.getParameter("itemName");
        String totalFlatsStr = request.getParameter("SecurityCode");

      

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/ssss";
            String username = "root";
            String password = "Akhil2004@";

            // Load the MySQL driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish a database connection
            conn = DriverManager.getConnection(url, username, password);

            // Create a SQL query to insert data into the BuildingInfo table
            String insertQuery = "INSERT INTO securityR (VisitorName, role, Securitycode) VALUES (?, ?, ?)";

            // Create a prepared statement
            stmt = conn.prepareStatement(insertQuery);
            stmt.setString(1, buildingName);
            stmt.setString(2, numFlatsperFloorStr);
            stmt.setString(3, totalFlatsStr );

            // Execute the SQL query to insert data
            stmt.executeUpdate();

            // Redirect back to the form with a success message
            response.sendRedirect("AddNewRegularVV.jsp?add=success");
        } catch (Exception e) {
            // Handle any exceptions here, such as database connection errors
            e.printStackTrace();

            // Redirect back to the form with an error message
            response.sendRedirect("AddNewRegularVV.jsp?error=3");
        } finally {
            // Close resources (e.g., database connection and statement)
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

