
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddVendorDetailsServlet")
public class AddVendorDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("VisitorName");
        String password = request.getParameter("SecurityCode");
       
     
        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/ssss";
        String dbUser = "root";
        String dbPassword = "Akhil2004@";
        Connection connection=null;

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        
             connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            String sql = "SELECT * FROM securityR WHERE Visitorname = ? AND securitycode = ? and role = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, "vendor");

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
            	String query="INSERT INTO vendor(vendorname, securitycode) VALUES (?, ?)";
            	 PreparedStatement preparedStatement1 = connection.prepareStatement(query);
                 preparedStatement1.setString(1, username);
                 preparedStatement1.setString(2, password);
                 preparedStatement1.executeUpdate();

                 // Close the resources
                 preparedStatement1.close();
                 connection.close();

                 
            	response.sendRedirect("AddVendorDetails.jsp?add=success");
            } else {
                // Login failed; you can show an error message or redirect back to the login page
                response.sendRedirect("AddVendorDetails.jsp?msg=error"); // Redirect back to the login page
            }

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
        finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}