import java.io.IOException;
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

@WebServlet("/MakePaymentServlet")
public class MakePaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int recordID = Integer.parseInt(request.getParameter("recordID"));
        String paymentMode = request.getParameter("paymentMode");
        System.out.println(paymentMode + recordID);

        // Database connection details
        String url = "jdbc:mysql://localhost:3306/ssss";
        String user = "root";
        String pass = "Akhil2004@";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, user, pass);

            // Insert payment details and update the payment status to "Paid"
            String updatePaymentDetailsQuery = "UPDATE MaintenanceRecords SET PaymentStatus = 'Paid', PaymentMode = ?, PaymentDate = ? WHERE  recordID = ?";
            PreparedStatement updatePaymentDetailsStatement = connection.prepareStatement(updatePaymentDetailsQuery);
            updatePaymentDetailsStatement.setString(1, paymentMode);

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String paymentDate = sdf.format(new Date());
            updatePaymentDetailsStatement.setString(2, paymentDate);


            updatePaymentDetailsStatement.setInt(3, recordID);

            int rowsAffected = updatePaymentDetailsStatement.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("Maintenance.jsp?pay=success");
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
