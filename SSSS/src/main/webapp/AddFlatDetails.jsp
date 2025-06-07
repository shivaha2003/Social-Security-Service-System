<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Purchases</title>
    <style>
       body {
    background-color: #fff; 
     font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
    margin: 0;
    justify-content: center;
    align-items: center;
    height: 100vh;
    color: #000000; 
}
.arr{
        position: absolute; 
      top: 32px;
      left: 290px;
      height: 80px;
        
       }

 .header{
        margin:6px;
             height: 130px;
             width:autopx;
             background-color:#0C2340;
             border-color:rgb(19,51,15);
            border-radius: 10px;
            border-style: solid;
            font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
            color: azure;
        }
       .logo{
      position: absolute; 
      top: 2px;
      left: 13px;
      height: 130px;
        width:210px;
       }
       .arrow{
        position: relative; 
      top: 18px;
      left: 600px;
       
       }
    

h1 {
    font-size: 50px;
    margin: 0;
    color: #fff;
    }


        
.is{
        position: absolute; 
      top: 33px;
      right: 130px;
        height: 80px;
        width: 90px;
       } 
       
     

        h1 {
            margin: 20px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #0C2340;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #0C2340;
            color: azure;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:nth-child(odd) {
            background-color: #e5e5e5;
        }
    </style>
</head>
<body>
    <div class="header">
        <img class="logo" src="Screenshot_2023-11-03_114032-removebg-preview.png" alt="BLAH-BLAH">
         <img class="arr" alt="" src="arrow.png">
          <a href="admin.jsp"   style="position: absolute;top: 115px;  left: 370px;color: azure; ;">HOME</a>
         <h1 class="arrow" style="font-size:40px;margin-right: 1200px;">MAA  &nbsp;HEIGHTS</h1>
        <h3 class="arrow" style="left: 660px;">WELCOME&nbsp; ADMIN!</h3>
        
          
        
         <b style="position: absolute; 
         top: 10px;
         right: 150px;" >ADMIN</b>
         <img class="is"src="download-removebg-preview.png" alt="ADMIN">
    
        <a href="/SSSS/AdminoutServlet"   style="position: absolute;top: 115px; right: 148px;color: azure; ;">Logout</a>
        
    </div> 
          
     <%
    int userID = 0;
    String username = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");
   

 
        
        if (username == null) {
            response.sendRedirect("ssss.html");
        }
    
%>
      <div id="successMessage" style=" margin:6px;display: none; background-color: #4CAF50; color: white; padding: 10px; text-align: center;">
        <h1>Added Successfully</h1>
        
    </div> 
    <h1>BUILDING DETAILS</h1>
    
   
    <%
    {
        String url = "jdbc:mysql://localhost:3306/ssss";
        String user = "root";
        String pass = "Akhil2004@";

        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, pass);
            String sql = "SELECT * FROM BuildingInfo ";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            

            ResultSet resultSet = preparedStatement.executeQuery();
    %>
    <table>
        <tr>
            <th>Building Name</th>
            <th>Flat_ID</th>
            <th>ADD THE FLAT</th>
            
        </tr>
        <%
            while (resultSet.next()) {
                String BuildingName = resultSet.getString("BuildingName");
                
                int Num = resultSet.getInt("NumFlatsperFloor");
                int Total = resultSet.getInt("Total_Flats");
                
        %>
        <tr>
            <td name="buildingName"><%= BuildingName %></td>
         
            
            <form action="AddFlatDetailsServlet" method="post">
    <input type="hidden" name="buildingName" value="<%= BuildingName %>">
 <td>
                <select name="selectedFlatId" id="selectedFlatId">
                    <%
                        int floors = Total / Num;
                        for (int floor = 1; floor <= floors; floor++) {
                            for (int flat = 1; flat <= Num; flat++) {
                                int flatId = (floor * 100) + flat;
                                // Check if the flatId is not in FlatInfo for the same building
                                String checkQuery = "SELECT FlatID FROM FlatInfo WHERE BuildingName=? AND FlatID=?";
                                PreparedStatement checkStatement = connection.prepareStatement(checkQuery);
                                checkStatement.setString(1, BuildingName);
                                checkStatement.setInt(2, flatId);
                                ResultSet checkResult = checkStatement.executeQuery();
                                if (!checkResult.next()) {
                    %>
                    <option value="<%= flatId %>"><%= flatId %></option>
                    <%
                                }
                            }
                        }
                    %>
                </select>
            </td> 
            <td> <input type="submit" value="Add"> </td>
</form>
            
        </tr>
        <%
            }
            resultSet.close();
            preparedStatement.close();
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
    }
    %>
    </table>
  <div class="footer" style="background-color: #333; color: #fff; text-align: center; padding: 10px;margin:6px; margin-top:400px;">
        <p><a href="aboutUs.jsp" style="color: #fff; text-decoration: none;">About Us</a></p>
        <p>Follow Us:</p>
        <a href="https://www.facebook.com/your-facebook-page" style="color: #fff; text-decoration: none; margin: 0 10px;">Facebook</a>
        <!-- Add links to other social media platforms as needed -->
        <p>&copy;Social Security Solution System. All Rights Reserved.</p>
        <img src="copyright.png" alt="Copyright" style="height: 20px;">
    </div>
     <script> 
		function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[[\]]/g, '\\$&');
            var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, ' '));
        }
        function showSuccessMessage() {
            var registration = getParameterByName('add');
            if (registration === 'success') {
                var successMessage = document.getElementById('successMessage');
                successMessage.style.display = 'block';

                setTimeout(function() {
                    successMessage.style.display = 'none';
                }, 3000); // Display for 3 seconds
            }
        }
        

        // Call the showSuccessMessage function when the page loads
        window.onload = showSuccessMessage;</script>
</body>
</html>