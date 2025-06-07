import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddResidentDetailsServlet")
public class AddResidentDetailsServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ssss";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Akhil2004@";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("FirstName");
        String lastName = request.getParameter("LastName");
        String itemName = request.getParameter("itemName");
        String mobilenum = request.getParameter("mobilenum");

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Insert User Account
            String username = firstName + lastName;
            String password = username + "123";
            int userID = insertUserAccount(connection, username, password, "resident");

            // Split itemName into FlatID and BuildingName
            String[] parts = itemName.split(" / ");
            int flatID = Integer.parseInt(parts[0]);
            String buildingName = parts[1];

            // Insert into ResidentDetails
            insertResidentDetails(connection, firstName, lastName, userID, flatID, buildingName, mobilenum);
            updateFlatStatus(connection, flatID, buildingName);
            response.sendRedirect("AddResidentDetails.jsp?add=success"); // Redirect to a success page
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to an error page in case of an exception
        }
    }

    private int insertUserAccount(Connection connection, String username, String password, String role) throws SQLException {
        String insertUserSql = "INSERT INTO UserAccounts (Username, UserPassword, UserRole) VALUES (?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(insertUserSql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, role);
            preparedStatement.executeUpdate();

            ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                return generatedKeys.getInt(1); // Return the generated UserID
            }
            return -1; // Handle this case appropriately
        }
    }

    private void insertResidentDetails(Connection connection, String firstName, String lastName, int userID, int flatID, String buildingName, String mobilenum) throws SQLException {
        String insertResidentSql = "INSERT INTO ResidentDetails (FirstName, LastName, UserID, FlatID, BuildingName, mobilenum) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(insertResidentSql)) {
            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setInt(3, userID);
            preparedStatement.setInt(4, flatID);
            preparedStatement.setString(5, buildingName);
            preparedStatement.setString(6, mobilenum);
          

            preparedStatement.executeUpdate();
        }
    }
    private void updateFlatStatus(Connection connection, int flatID, String buildingName) throws SQLException {
        String updateStatusSql = "UPDATE FlatInfo SET status = 'occupied' WHERE FlatID = ? AND BuildingName = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(updateStatusSql)) {
            preparedStatement.setInt(1, flatID);
            preparedStatement.setString(2, buildingName);
            preparedStatement.executeUpdate();
        }
    }


 
}

