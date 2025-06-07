<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <title>Regular Visitor Details</title>
    
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
         
          <a href="supervisor.jsp"   style="position: absolute;top: 115px;  left: 370px;color: azure; ;">HOME</a>
        
         <h1 class="arrow" style="font-size:40px; margin-right: 1200px;">MAA  &nbsp;HEIGHTS</h1>
        <h3 class="arrow" style="left: 650px;">WELCOME&nbsp; SUPERVISOR!</h3>
        
          
        
         <b style="position: absolute; 
         top: 10px;
         right: 130px;" >SUPERVISOR</b>
         <img class="is"src="download-removebg-preview.png" alt="ADMIN">
    
        <a href="AdminoutServlet"   style="position: absolute;top: 115px; right: 148px;color: azure; ;">Logout</a>
        
  </div>
  <%
    int userID = 0;
    String username = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");
   

 
        
        if (username == null) {
            response.sendRedirect("ssss.html");
        }
    
%>
    
    <h1>REGULAR VISITOR DETAILS</h1>
    
        <table>
            <tr>
                <th>Visitor Name</th>
                <th>Security Code</th>
                <th>Check-In Time</th>
                <th>Check-Out Time</th>
                <th>Save Status</th>
            </tr>
            <%
                try {
                    // Your database connection code here
                    String url = "jdbc:mysql://localhost:3306/ssss";
                    String user = "root";
                    String pass = "Akhil2004@";
                    
                    Connection connection = null;

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(url, user, pass);
                    String sql = "SELECT * FROM Regularvisits";
                    PreparedStatement preparedStatement = connection.prepareStatement(sql);
                    ResultSet resultSet = preparedStatement.executeQuery();

                    while (resultSet.next()) {
                        String visitorName = resultSet.getString("VisitorName");
                        String securityCode = resultSet.getString("SecurityCode");
                        String checkInTime = resultSet.getString("CheckInTime");
                        String checkOutTime = resultSet.getString("CheckOutTime");
                    %>
                    
                    <tr>
					    <form action="SaveRegularVisitorDetailsServlet" method="post">
					        <td><%= visitorName %></td>
					        <td><%= securityCode %></td>
					        <td><%= checkInTime %></td>
					        <td>
					            <%
					                if (checkOutTime != null) {
					            %>
					            <%= checkOutTime %>
					            <%
					                } else {
					            %>
					            <input type="hidden" name="securityCode" value="<%= securityCode %>">
					            <input type="hidden" name="visitorName" value="<%= visitorName %>">
					            
					            <input type="text" name="checkOutTime" placeholder="YYYY-MM-DD HH:mm:ss">
					            <%
					                }
					            %>
					        </td>
					        <td>
					            <%
					                if (checkOutTime == null) {
					            %>
					            <input type="submit" name="save" value="Save">
					            <%
					                } else {
					            %>
					            SAVED
					            <%
					                }
					            %>
					        </td>
					    </form>
					</tr>

                    <%
                    }
                    resultSet.close();
                    preparedStatement.close();
                } catch (Exception e) {
                    e.printStackTrace();
                } 
            %>
        </table>
    
</body>
</html>


