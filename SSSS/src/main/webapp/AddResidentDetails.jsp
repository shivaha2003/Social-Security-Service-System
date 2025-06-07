<%@ page import="java.io.IOException,java.util.ArrayList, java.io.PrintWriter, java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Resident Details</title>
    <style>
        body {
            background-color: #fff;
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
            margin: 0;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #000000;
        }

        .arr {
            position: absolute;
            top: 32px;
            left: 290px;
            height: 80px;
        }

        .header {
            margin: 6px;
            height: 130px;
            width: auto px;
            background-color: #0C2340;
            border-color: rgb(19, 51, 15);
            border-radius: 10px;
            border-style: solid;
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
            color: azure;
        }

        .logo {
            position: absolute;
            top: 2px;
            left: 13px;
            height: 130px;
            width: 210px;
        }

        .arrow {
            position: relative;
            top: 18px;
            left: 600px;
        }

        h1 {
            font-size: 50px;
            margin: 0;
            color: #fff;
        }

        .is {
            position: absolute;
            top: 33px;
            right: 130px;
            height: 80px;
            width: 90px;
        }

        .funk {
            border-radius: 6px;
            border-style: solid;
            margin-bottom: 10px;
            border-width: 3px;
            border-color: #0C2340;
            height: 25px;
            width: 310px;
            padding: 15px 10px;
            font-size: 14px;
        }

        .sub {
            margin: 40px 210px;
            border-radius: 8px;
            border-color: rgb(19, 51, 15);
            height: 50px;
            width: 140px;
            font-size: 20px;
            background-color: #0C2340;
            color: azure;
            text-align: center;
            cursor: pointer;
        }

        .akhil {
            margin: 35px auto;
            padding: 60px 70px 170px 70px;
            margin-bottom: 500px;
            border-style: solid;
            border-width: 8px;
            border-radius: 6px;
            border-color: #0C2340;
            height: 300px;
            width: 530px;
        }
    </style>
</head>
<body>
<div class="header">
    <img class="logo" src="Screenshot_2023-11-03_114032-removebg-preview.png" alt="BLAH-BLAH">
    <img class="arr" alt="" src="arrow.png">
              <a href="admin.jsp"   style="position: absolute;top: 115px;  left: 370px;color: azure; ;">HOME</a>
    <h1 class="arrow" style="font-size: 40px; margin-right: 1200px;">MAA &nbsp;HEIGHTS</h1>
    <h3 class="arrow" style="left: 660px;">WELCOME&nbsp; ADMIN!</h3>

    <b style="position: absolute; top: 10px; right: 150px;">ADMIN</b>
    <img class="is" src="download-removebg-preview.png" alt="ADMIN">

    <a href="/SSSS/AdminoutServlet"
       style="position: absolute; top: 115px; right: 148px; color: azure;">Logout</a>
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
<div class="center-box">
    <form class="akhil" action="AddResidentDetailsServlet" method="POST">
        <h2 style="margin-left:110px; margin-bottom:40px;">Add Resident Details</h2>
        <label for="FirstName">First Name:</label d>
        <input class="funk" type="text" name="FirstName" style="margin-left:100px;" required><br>
        <label for="LastName">Last Name:</label>
        <input class="funk" type="text" name="LastName" style="margin-left:100px;" required><br>

        <label for="itemName">Flat ID / Building Name:</label>
        <%
        //String selectedValue = ""; // Set the selected value here
        %>
        <select  name="itemName" id="itemName" style="margin-left:10px; padding:26px; border-radius: 6px;
            border-style: solid;
             padding: 15px 10px;
            margin-bottom: 10px;
            border-width: 3px;
            border-color: #0C2340; height: 60px;
            width: 326px;" required>
           <!-- 
            <option value="itemName" >-- Select Flat ID / Building Name --</option>
            --> 
            <%
                String url = "jdbc:mysql://localhost:3306/ssss";
                String user = "root";
                String pass = "Akhil2004@";
                ArrayList<String> itemNames = new ArrayList<String>();

                Connection connection = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(url, user, pass);

                    String flatQuery = "SELECT FlatID, BuildingName FROM FlatInfo WHERE status = 'empty' ORDER BY BuildingName, FlatID";
                    PreparedStatement flatStatement = connection.prepareStatement(flatQuery);
                    ResultSet flatResult = flatStatement.executeQuery();

                    while (flatResult.next()) {
                        int flatID = flatResult.getInt("FlatID");
                        String buildingName = flatResult.getString("BuildingName");
                        String itemName = flatID + " / " + buildingName;
                        itemNames.add(itemName);
                    }
                    flatResult.close();
                    flatStatement.close();
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

                for (String itemName : itemNames) {
            %>
            <option value="<%= itemName %>"><%= itemName %></option>
            <%
                }
            %>
        </select><br>

        <label for="mobilenum">Mobile Number:</label>
        <input class="funk" type="text" name="mobilenum" style="margin-left:70px;" required><br>

        <input class="sub" type="submit" value="Add">
    </form>
</div>

<div class="footer" style="background-color: #333; color: #fff; text-align: center; padding: 10px;margin:6px; margin-top:400px;">
        <p><a href="aboutUs.jsp" style="color: #fff; text-decoration: none;">About Us</a></p>
        <p>Follow Us:</p>
        <a href="https://www.facebook.com/your-facebook-page" style="color: #fff; text-decoration: none; margin: 0 10px;">Facebook</a>
        <!-- Add links to other social media platforms as needed -->
        <p>&copy;Social Security Solution System. All Rights Reserved.</p>
        <img src="copyright.png" alt="Copyright" style="height: 20px;">
    </div>
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

