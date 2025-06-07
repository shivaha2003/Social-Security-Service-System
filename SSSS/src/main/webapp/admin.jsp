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
        <h3 class="arrow" style="left: 650px;">WELCOME&nbsp; ADMIN!</h3>
        
          
        
         <b style="position: absolute; 
         top: 10px;
         right: 150px;" >ADMIN</b>
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
<div class="center-box">
    <div class="option add-link">
        <a style="color:#17202A ;"href="AddBuildingDetails.jsp"><b>Add Building Details</b></a>
    </div>
    <div class="option display-link">
        <a style="color:#17202A "href="ShowBuildingDetails.jsp"><b>Display Building Details</b></a>
    </div>
    <div class="option add-link">
        <a style="color:#17202A "href="AddFlatDetails.jsp"><b>Add Flat Details</b></a>
    </div>
    <div class="option display-link">
        <a style="color:#17202A "href="ShowFlatDetails.jsp"><b>Display Flat Details</b></a>
    </div>
    <div class="option add-link">
        <a style="color:#17202A " href="AddResidentDetails.jsp"><b>Add Resident Details</b></a>
    </div>
    <div class="option display-link">
        <a style="color:#17202A " href="ShowResidentDetails.jsp"><b>Display Resident Details</b></a>
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