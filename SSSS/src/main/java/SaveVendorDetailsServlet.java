import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

@WebServlet("/SaveVendorDetailsServlet")
public class SaveVendorDetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Extract the visitorName from the button name
    	String visitorName = request.getParameter("visitorName"); // Use the unique submit button name

        // Extract the corresponding checkOutTime and securityCode
        String checkOutTime = request.getParameter("checkOutTime");
        String securityCode = request.getParameter("securityCode");
        System.out.println(checkOutTime);

        String url = "jdbc:mysql://localhost:3306/ssss";
        String user = "root";
        String pass = "Akhil2004@";

        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, pass);
            String updateSql = "UPDATE vendor SET CheckOutTime = ? WHERE VendorName = ? AND SecurityCode = ?";
            PreparedStatement updateStatement = connection.prepareStatement(updateSql);

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            java.util.Date parsedDate = sdf.parse(checkOutTime);
            java.sql.Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());

            updateStatement.setTimestamp(1, timestamp);
            updateStatement.setString(2, visitorName);
            updateStatement.setString(3, securityCode);

            // Execute the update statement
            updateStatement.executeUpdate();

            updateStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        response.sendRedirect("VendorDetails.jsp");
    }
}
