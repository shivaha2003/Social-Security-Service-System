
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

@WebServlet("/AddFlatDetailsServlet")
public class AddFlatDetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the submitted buildingName and selectedFlatId from the form
        String buildingName = request.getParameter("buildingName");
        int selectedFlatId = Integer.parseInt(request.getParameter("selectedFlatId"));

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/ssss";
        String user = "root";
        String pass = "Akhil2004@";

        try {
            // Establish a database connection
            Connection connection = DriverManager.getConnection(url, user, pass);

            // Insert data into the FlatInfo table
            String insertQuery = "INSERT INTO FlatInfo (FlatID, BuildingName) VALUES (?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setInt(1, selectedFlatId);
            preparedStatement.setString(2, buildingName);
            preparedStatement.executeUpdate();

            // Close the resources
            preparedStatement.close();
            connection.close();

            // Redirect to a confirmation page
            response.sendRedirect("AddFlatDetails.jsp?add=success");
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database errors and show an error page or message to the user
            response.sendRedirect("error.jsp");
        }
    }
}

