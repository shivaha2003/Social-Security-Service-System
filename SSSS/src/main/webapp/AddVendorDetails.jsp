<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Building Details</title>
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
       
     
        .funk{
           
        border-radius: 6px;
        border-style: solid;
        margin-bottom: 10px;
        border-width: 3px;
        border-color:#0C2340;
         height: 25px;
         width: 310px;
         padding: 15px 10px;
         font-size: 14px;
         
    }
    .sub{
        margin: 40px 210px;
        border-radius: 8px;
    
             border-color:rgb(19,51,15);
        height: 50px;
        width: 140px;
    
        font-size: 20px; 
       background-color:#0C2340;
            color: azure;
            text-align: center;
           
    
            cursor: pointer;
    }
    .akhil{
        
        margin:35px auto;
        padding:60px 70px 170px 70px;
        margin-bottom:500px;
        
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
         
       
          <a href="supervisor.jsp"   style="position: absolute;top: 115px;  left: 370px;color: azure; ;">HOME</a>
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
      <div id="successMessage" style=" margin:6px;display: none; background-color: #4CAF50; color: white; padding: 10px; text-align: center;">
        <h1>Added Successfully</h1>
        
    </div> 
<div class="center-box">
    
    <form class="akhil"action="AddVendorDetailsServlet" method="POST">
        
            <h2  style="margin-left: 105px;">ADD-Vendor DETAILS </h2> <br><br>
           <label for="VisitorName" style="font-size: 16px;"><strong>&nbsp;&nbsp;&nbsp;Vendor Name : </strong></label>
           <input type="text"class="funk" name="VisitorName" style="margin-left: 50px;" placeholder="Enter here"> <br> <br>
           <label for="SecurityCode" style="font-size: 16px;">&nbsp;&nbsp;&nbsp;<strong>Security code:</strong></label>
           <input type="text" class="funk" name="SecurityCode" style="margin-left: 25px;"placeholder="Enter Security code here"> <br> <br>
            
            <input type="submit" class="sub" value="ADD">
        
    </form>
</div>


   <div class="footer" style="background-color: #333; color: #fff; text-align: center; padding: 10px;margin:6px;">
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