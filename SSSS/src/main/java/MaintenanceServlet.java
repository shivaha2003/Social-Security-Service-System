import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MaintenanceServlet")
public class MaintenanceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Retrieve parameters from the form
        String itemName = request.getParameter("itemName");  // Format: "FlatID / Building Name"
        BigDecimal amount = new BigDecimal(request.getParameter("Amount"));

        // Split itemName into FlatID and BuildingName
        String[] parts = itemName.split(" / ");
        int flatID = Integer.parseInt(parts[0]);
        String buildingName = parts[1];

        // Set PaymentStatus to "Due"
        String paymentStatus = "Due";

        

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Create a database connection (update with your database information)

            String jdbcURL = "jdbc:mysql://localhost:3306/ssss";
            String jdbcUser = "root";
            String jdbcPassword = "Akhil2004@";
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUser, jdbcPassword);

            // Prepare and execute an SQL statement to insert maintenance record
            String insertQuery = "INSERT INTO MaintenanceRecords (FlatID, BuildingName, Amount, PaymentStatus) VALUES (?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setInt(1, flatID);
            preparedStatement.setString(2, buildingName);
            preparedStatement.setBigDecimal(3, amount);
            preparedStatement.setString(4, paymentStatus);
           

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                // Insertion was successful
                response.sendRedirect("MaintenanceDetails.jsp?add=success");
            } else {
                // Insertion failed
                response.sendRedirect("MaintenanceDetails.jsp?add=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions and errors
            response.sendRedirect("MaintenanceDetails.jsp?add=error");
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
