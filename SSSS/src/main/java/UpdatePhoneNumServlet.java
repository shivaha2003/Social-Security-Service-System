import java.io.IOException;
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

@WebServlet("/UpdatePhoneNumServlet")
public class UpdatePhoneNumServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the new username from the form
        String newUsername = request.getParameter("newUsername");

        // Get the user's ID or some identifier (you should adapt this part based on your application)
        String username = (String)request.getSession().getAttribute("username");
        String password = (String)request.getSession().getAttribute("password");
        int userID=0;

        // Database connection details
        String url = "jdbc:mysql://localhost:3306/ssss";
        String user = "root";
        String pass = "Akhil2004@";
      

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, user, pass);
            String sQuery = "SELECT UserID FROM UserAccounts WHERE Username = ? and UserPassword =?";
            PreparedStatement Statement = connection.prepareStatement(sQuery);
            Statement.setString(1, username);
            Statement.setString(2, password);
            ResultSet Result = Statement.executeQuery();
            if (Result.next()) {
                userID = Result.getInt("UserID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, user, pass);
          

            
            String updateUsernameQuery = "UPDATE residentDetails SET mobilenum = ? WHERE userID = ?";
            PreparedStatement updateUsernameStatement = connection.prepareStatement(updateUsernameQuery);
            updateUsernameStatement.setString(1, newUsername);
            updateUsernameStatement.setInt(2, userID);
           
            int rowsAffected = updateUsernameStatement.executeUpdate();

            if (rowsAffected > 0) {
                
                response.sendRedirect("Resident.jsp?update=success");
            } else {
                // Redirect to a failure page or provide a failure message
                response.sendRedirect("UpdateUsernameFailure.jsp");
            }

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
