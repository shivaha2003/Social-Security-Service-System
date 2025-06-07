<%@ page import="java.sql.*, java.util.Base64, jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" %>
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
        
             <a href="supervisor.jsp"   style="position: absolute;top: 115px;  left: 370px;color: azure; ;">HOME</a>
        
         <b style="position: absolute; 
         top: 10px;
         right: 150px;" >ADMIN</b>
         <img class="is"src="download-removebg-preview.png" alt="ADMIN">
    
        <a href="/SSSS/AdminoutServlet"   style="position: absolute;top: 115px; right: 148px;color: azure; ;">Logout</a>
        
    </div> 
    <h1>STAFF DETAILS</h1>
   <%
        String url = "jdbc:mysql://localhost:3306/ssss";
        String user = "root";
        String pass = "Akhil2004@";

        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, pass);
            String sql = "SELECT * FROM StaffInfo order by StaffID";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
    %>

    <table>
        <tr>
            <th>Staff ID</th>
            <th>Name</th>
      
           
            <th>Role</th>
            <th>Contact</th>
         
       
            
        </tr>
        <%
            while (resultSet.next()) {
                int StaffID = resultSet.getInt("StaffID");
                String Name = resultSet.getString("StaffFullName");
                String role = resultSet.getString("role");
                String phone = resultSet.getString("ContactPhone");
        %>
        <tr>
            <td><%= StaffID %></td>
            <td><%= Name %></td>
       
            <td><%= role %></td>
             <td><%= phone %></td>
          
           
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
    
    %>
    </table>
</body>
</html>