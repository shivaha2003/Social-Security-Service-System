
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

@WebServlet("/SSSSLogin")
public class SSSSLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("Username");
        String password = request.getParameter("password");
     
        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/ssss";
        String dbUser = "root";
        String dbPassword = "Akhil2004@";
        Connection connection=null;

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
             connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            String sql = "SELECT * FROM UserAccounts WHERE Username = ? AND UserPassword = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
            	 HttpSession session = request.getSession();
         	    session.setAttribute("username",username);
         	   session.setAttribute("password",password);
         	    String role=resultSet.getString("UserRole");
         	    if(role.equals("Admin")) {
                // Successful login; redirect to a user dashboard or other page
                response.sendRedirect("admin.jsp"); }
         	    else if(role.equals("Supervisor")){// Replace with your dashboard page
         	    	response.sendRedirect("supervisor.jsp");
         	    } else if(role.equals("Resident")) {
         	    	response.sendRedirect("Resident.jsp");
         	    }
            } else {
                // Login failed; you can show an error message or redirect back to the login page
                response.sendRedirect("SSSSlogin.html"); // Redirect back to the login page
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