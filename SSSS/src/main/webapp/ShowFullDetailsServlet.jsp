<%@ page import="java.io.IOException, java.io.PrintWriter, java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Flat Details</title>
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
        // Get the selected building from the request
        String selectedBuilding = request.getParameter("selectedBuilding");

        // JDBC parameters
        String url = "jdbc:mysql://localhost:3306/ssss";
        String user = "root";
        String pass = "Akhil2004@";

        Connection connection = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            connection = DriverManager.getConnection(url, user, pass);

            // Query the database to retrieve flat details for the selected building
            String flatQuery = "SELECT FlatID, Status FROM FlatInfo WHERE BuildingName = ?";
            PreparedStatement flatStatement = connection.prepareStatement(flatQuery);
            flatStatement.setString(1, selectedBuilding);

            ResultSet flatResult = flatStatement.executeQuery();
    %>
    <h1 style="color:black; margin-bottom:60px;"> <%= selectedBuilding %> Flat Details</h1>
    <table>
        <tr>
            <th>Flat ID</th>
            <th>Status</th>
        </tr>

        <%
            while (flatResult.next()) {
                int flatId = flatResult.getInt("FlatID");
                String status = flatResult.getString("Status");
        %>
        <tr>
            <td><%= flatId %></td>
            <td><%= status %></td>
        </tr>
        <%
            }
            flatResult.close();
            flatStatement.close();
        %>
    </table>

    <%
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
    %>
</body>
</html>
