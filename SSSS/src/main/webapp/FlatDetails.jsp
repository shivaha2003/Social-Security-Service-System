<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Show Flat Details</title>
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

        select {
            width: 100%;
            padding: 5px;
        }
    </style>
</head>
<body>
<div class="header">
        <img class="logo" src="Screenshot_2023-11-03_114032-removebg-preview.png" alt="BLAH-BLAH">
         <img class="arr" alt="" src="arrow.png">
           <a href="supervisor.jsp"   style="position: absolute;top: 115px;  left: 370px;color: azure; ;">HOME</a>
       
        
         <h1 class="arrow" style="font-size:40px;margin-right:1200px;">MAA  &nbsp;HEIGHTS</h1>
        <h3 class="arrow" style="left: 650px;">WELCOME&nbsp; SUPERVISOR!</h3>
        
          
        
         <b style="position: absolute; 
         top: 10px;
         right: 130px;" >SUPERVISOR</b>
         <img class="is"src="download-removebg-preview.png" alt="ADMIN">
    
        <a href="SupervisoroutServlet"   style="position: absolute;top: 115px; right: 148px;color: azure; ;">Logout</a>
        
  </div>
   <%
    int userID = 0;
    String username = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");
   

 
        
        if (username == null) {
            response.sendRedirect("ssss.html");
        }
    
%>
<h1>SHOW FLAT DETAILS</h1>

<%
{
    String url = "jdbc:mysql://localhost:3306/ssss";
    String user = "root";
    String pass = "Akhil2004@";

    Connection connection = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, pass);

        // Retrieve building names from BuildingInfo
        String buildingQuery = "SELECT BuildingName FROM BuildingInfo";
        PreparedStatement buildingStatement = connection.prepareStatement(buildingQuery);
        ResultSet buildingResult = buildingStatement.executeQuery();
%>
<form action="ShowFullDetailsServlet.jsp" method="post">
    <label style="font-size:30px; margin-left:630px;"for="selectedBuilding">Select a Building:</label> <br> <br>
    <select name="selectedBuilding" id="selectedBuilding">
        <option value="">-- Select Building --</option>
        <%
            while (buildingResult.next()) {
                String buildingName = buildingResult.getString("BuildingName");
        %>
        <option value="<%= buildingName %>"><%= buildingName %></option>
        <%
            }
            buildingResult.close();
            buildingStatement.close();
        %>
    </select>
    <input type="submit" style="margin-left:670px; margin-top:20px;" value="Show Details">
</form>


   
    <table>
    <tr>
        <th>Flat ID</th>
        <th>Status</th>
    </tr>
  
   
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
}
%>

<div class="footer" style="background-color: #333; color: #fff; text-align: center; padding: 10px;margin:6px; margin-top:400px;">
    <p><a href="aboutUs.jsp" style="color: #fff; text-decoration: none;">About Us</a></p>
    <p>Follow Us:</p>
    <a href="https://www.facebook.com/your-facebook-page" style="color: #fff; text-decoration: none; margin: 0 10px;">Facebook</a>
    <p>&copy;Social Security Solution System. All Rights Reserved.</p>
    <img src="copyright.png" alt="Copyright" style="height: 20px;">
</div>
</body>
</html>
