import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateVisitorStatusServlet")
public class UpdateVisitorStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int visitorID = Integer.parseInt(request.getParameter("visitorID"));
        String status = request.getParameter("status");
        String url = "jdbc:mysql://localhost:3306/ssss";
        String user = "root";
        String pass = "Akhil2004@";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, user, pass);

            // Create a SimpleDateFormat to format the current date and time
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            String checkInTime = dateFormat.format(date);

            // Update the visitor status and, if approved, update the check-in time
            String updateStatusQuery;
            if (status.equals("approved")) {
                updateStatusQuery = "UPDATE normalVisits SET VisitStatus = ?, CheckInTime = ? WHERE VisitorID = ?";
            } else {
                updateStatusQuery = "UPDATE normalVisits SET VisitStatus = ? WHERE VisitorID = ?";
            }

            PreparedStatement updateStatusStatement = connection.prepareStatement(updateStatusQuery);
            updateStatusStatement.setString(1, status);
            if (status.equals("approved")) {
                updateStatusStatement.setString(2, checkInTime);
                updateStatusStatement.setInt(3, visitorID);
            } else {
                updateStatusStatement.setInt(2, visitorID);
            }
            
            int rowsAffected = updateStatusStatement.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("Resident.jsp?msg=success");
            } else {
                response.sendRedirect("your-failure-page.jsp");
            }

            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("your-error-page.jsp");
        }
    }
}
