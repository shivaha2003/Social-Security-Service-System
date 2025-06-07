<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
             width:auto;
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
       
.center-box {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin:6px 6px;
        padding:30px 70px 900px 70px;
       
        border-style: solid;
        border-width: 8px;
        border-radius: 6px;
        border-color: #0C2340;
        height: auto;
        width: auto;
}

.navbar {
    display: flex; /* Change flex-direction to row */
    align-items: center;
    gap: 200px; /* Added gap for horizontal spacing between links */
}

.nav-link {
border-style:solid;
    background-color: #80c7ff;
     /*background-color: #ff8080;*/ /* Background color for navigation links */
    color: black; /* Text color for navigation links */
    text-decoration: none;
    font-size: 24px;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    text-align: center;
    transition: transform 0.2s;
    width: 300px;
}

/* Hover effect for navigation links */
.nav-link:hover {
    transform: scale(1.05);
}
       
.center-box {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .option {
    border-style:solid;
         
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        text-align: center;
        transition: transform 0.2s;
        margin: 10px 0; /* Added margin for vertical spacing */
    }

    .option a {
        text-decoration: none;
        font-size: 24px;
    }

    /* Style "Add" anchor tags */
    .add-link {
        background-color: #ff8080; /* Background color for "Add" links */
        color:#17202A ; /* Text color for "Add" links */
        text-align: center;
        height: 40px;
     
        width: 300px;
        justify-content: flex-end; /* Align "Add" links to the right */
    }

    /* Style "Display" anchor tags */
    .display-link {
        background-color: #80c7ff; /* Background color for "Display" links */
        color:black; /* Text color for "Display" links */
        text-align: center;
        height: 40px;
        width: 300px;
        justify-content: flex-start; /* Align "Display" links to the left */
    }
    .center-box{

        margin:6px 6px;
        padding:60px 70px 300px 70px;
       
        
        border-style: solid;
        border-width: 8px;
        border-radius: 6px;
        border-color: #0C2340;
        height: auto;
        width: auto;
    }


</style>
</head>
<body>
  <div class="header">
        <img class="logo" src="Screenshot_2023-11-03_114032-removebg-preview.png" alt="BLAH-BLAH">
         <img class="arr" alt="" src="arrow.png">
         
       
        
         <h1 class="arrow" style="font-size:40px;">MAA  &nbsp;HEIGHTS</h1>
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
<div class="center-box">
    <nav class="navbar">
        <a class="nav-link"  href="BuildingDetails.jsp"><b>Building Details</b></a>
        <a class="nav-link" style= "background-color: #ff8080; width:400px; margin-right:-40px;margin-left:-40px;" href="AddNewRegularVV.jsp"><b>Add new Regular Visitor/vendor</b></a>
        <a class="nav-link" href="FlatDetails.jsp"><b>Flat Details</b></a>
        
    </nav> <br><br>
    
    <div class="navbar">
        <a class="nav-link"style="color:#17202A ;background-color: #ff8080;"href="AddnormalVisitor.jsp"><b>Add Normal visitor Details</b></a>
        <a class="nav-link"style="color:#17202A;background-color: #ff8080; "href="normalVistorDetails.jsp"><b> Normal Visitor Details</b></a>
    </div> <br><br>
    
    <div class="navbar">
        <a class="nav-link" style="color:#17202A "href="AddRegularVistorDetails.jsp"><b>Add Regular visitor Details</b></a>
        <a class="nav-link" style="color:#17202A "href="RegularVistorDetails.jsp"><b>Regular Visitor Details</b></a>
    </div> <br><br>
    
    <div class="navbar">
        <a class="nav-link" style="color:#17202A ;background-color: #ff8080; " href="AddVendorDetails.jsp"><b>Add Vendor Details</b></a>
        <a class="nav-link" style="color:#17202A;background-color: #ff8080; " href="VendorDetails.jsp"><b> Vendor Details</b></a>
    </div> <br><br>
    
    <div class="navbar">
        <a class="nav-link"style="color:#17202A " href="AddStaffDetails.jsp"><b> Add Staff Details</b></a>
        <a class="nav-link" style="color:#17202A " href="StaffDetails.jsp"><b> View Staff Details</b></a>
    </div>
     <br><br>
        <div class="navbar">
        <a class="nav-link"style="color:#17202A ;background-color: #ff8080;" href="MaintenanceDetails.jsp"><b>Add Maintenance Details</b></a>
        <a class="nav-link"style="color:#17202A ;background-color: #ff8080;" href="ViewMaintenanceDetails.jsp"><b> Maintenance Details</b></a>
    </div>
    
      </div>
       



   <div class="footer" style="background-color: #333; color: #fff; text-align: center; padding: 10px;margin:6px;">
        <p><a href="aboutUs.jsp" style="color: #fff; text-decoration: none;">About Us</a></p>
        <p>Follow Us:</p>
        <a href="https://www.facebook.com/your-facebook-page" style="color: #fff; text-decoration: none; margin: 0 10px;">Facebook</a>
        <!-- Add links to other social media platforms as needed -->
        <p>&copy;Social Security Solution System. All Rights Reserved.</p>
        <img src="copyright.png" alt="Copyright" style="height: 20px;">
    </div>
    

     	
</body>
</html>
