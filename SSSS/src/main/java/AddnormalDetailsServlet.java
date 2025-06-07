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

@WebServlet("/AddnormalDetailsServlet")
public class AddnormalDetailsServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ssss";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Akhil2004@";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("FirstName");
    
        String itemName = request.getParameter("itemName");
        String mobilenum = request.getParameter("relation");

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            

            // Split itemName into FlatID and BuildingName
            String[] parts = itemName.split(" / ");
            int flatID = Integer.parseInt(parts[0]);
            String buildingName = parts[1];
            String status = "pending";
            // Insert into ResidentDetails
            System.out.println(firstName +flatID + buildingName + status + mobilenum);
            insertVisitorDetails(connection, firstName, flatID, buildingName, mobilenum,status);
           
            response.sendRedirect("AddnormalVisitor.jsp?add=success"); // Redirect to a success page
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to an error page in case of an exception
        }
    }

  

    private void insertVisitorDetails(Connection connection, String firstName, int FlatID, String buildingName, String mobilenum,String status) throws SQLException {
        String insertResidentSql = "INSERT INTO normalVisits (GuestName, FlatID, BuildingName, Relation,VisitStatus) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(insertResidentSql)) {
            preparedStatement.setString(1, firstName);
            
            preparedStatement.setInt(2, FlatID);
           
            preparedStatement.setString(3, buildingName);
            preparedStatement.setString(4, mobilenum);
            preparedStatement.setString(5, status);

            preparedStatement.executeUpdate();
        }
    }
  


 
}

