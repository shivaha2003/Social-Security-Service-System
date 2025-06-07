<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>


<!DOCTYPE html>
<html>
<head>
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
    width: auto;
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
.center-box {
    margin: 6px 6px;
    padding: 60px 70px 300px 70px;
    border-style: solid;
    border-width: 8px;
    border-radius: 6px;
    border-color: #0C2340;
    height: auto;
    width: auto;
}

navbar {
    display: flex;
    align-items: center;
    gap: 400px;
}

.nav-link {
    border-style: solid;
    background-color: #80c7ff;
    color: black;
    text-decoration: none;
    font-size: 24px;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    text-align: center;
    transition: transform 0.2s;
    width: 300px;
    margin-left: 70px;
}

.nav-link:hover {
    transform: scale(1.05);
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
     <a href="Resident.jsp"   style="position: absolute;top: 115px;  left: 370px;color: azure; ;">HOME</a>
    <h1 class="arrow" style="font-size:40px; margin-right:1210px;">MAA &nbsp;HEIGHTS</h1>
    <h3 class="arrow" style="left: 620px;">WELCOME&nbsp; DEAR RESIDENT!</h3>
    <b style="position: absolute; top: 10px; right: 140px;">RESIDENT</b>
    <img class="is" src="Userlog.png" alt="ADMIN">
    <a href="AdminoutServlet" style="position: absolute; top: 115px; right: 148px; color: azure;">Logout</a>
</div>  <br> 

    <h2 style="margin-left:700px;"> MAINTENANCE </h2> <br> 
<table>
    <tr>
        <th>Amount</th>
        <th>Payment Status</th>
        <th>Payment Mode</th>
        <th>Payment Date</th>
        <th>Action</th>
    </tr>
    <%
    int userID = 0;
    String username = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");

    if (username == null) {
        response.sendRedirect("ssss.html");
    }

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
    }

    int flatID = 0; // Initialize with the actual value from the database
    String buildingName = ""; // Initialize with the actual value from the database
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(url, user, pass);
        String residentDetailsQuery = "SELECT FlatID, BuildingName FROM ResidentDetails WHERE UserID = ?";
        PreparedStatement residentDetailsStatement = connection.prepareStatement(residentDetailsQuery);
        residentDetailsStatement.setInt(1, userID);
        ResultSet residentDetailsResult = residentDetailsStatement.executeQuery();
        if (residentDetailsResult.next()) {
            flatID = residentDetailsResult.getInt("FlatID");
            buildingName = residentDetailsResult.getString("BuildingName");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    %>

    
    <%
    try {
        Connection connection = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, pass);
        String sql = "SELECT recordID,Amount, PaymentStatus, PaymentMode, PaymentDate FROM MaintenanceRecords WHERE FlatID = ? AND BuildingName = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, flatID);
        preparedStatement.setString(2, buildingName);
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
        	int recordID = resultSet.getInt("recordID");
            double amount = resultSet.getDouble("Amount");
            String paymentStatus = resultSet.getString("PaymentStatus");
            String paymentMode = resultSet.getString("PaymentMode");
            String paymentDate = resultSet.getString("PaymentDate");
    %>

    <tr>
    <form action="MakePaymentServlet" method="post">
        <td><%= amount %></td>
        <td><%= paymentStatus %></td>
        <td>
            <%
            if ("Paid".equals(paymentStatus)) {
            %>
            <%= paymentMode %>
            <%
            } else {
            %>
            <select name="paymentMode">
                <option value="UPI">UPI</option>
                <option value="CASH">CASH</option>
                <option value="NET BANKING">NET BANKING</option>
                <option value="DEBIT CARD">DEBIT CARD</option>
                <option value="CREDIT CARD">CREDIT CARD</option>
            </select>
            <%
            }
            %>
        </td>
        <td>
            <%
            if ("Paid".equals(paymentStatus)) {
            %>
            <%= paymentDate %>
            <%
            }
            %>
        </td>
        <td>
            <%
            if ("Paid".equals(paymentStatus)) {
            %>
            Already Paid
            <%
            } else {
            %>
            
                
                <input type="hidden" name="recordID" value="<%= recordID %>">
               
                <input type="hidden" name="paymentMode" value="<%= paymentMode %>">
                <input type="submit" name="pay" value="Pay">
            </form>
            <%
            }
            %>
        </td>
    </tr>

    <%
        }
        resultSet.close();
        preparedStatement.close();
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
</table>
<!-- More HTML content -->

<!-- More HTML content -->


</body>
</html>
