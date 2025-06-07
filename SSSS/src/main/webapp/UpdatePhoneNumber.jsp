<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Username</title>
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
    padding: 60px 70px 800px 70px;
    border-style: solid;
    border-width: 8px;
    border-radius: 6px;
    border-color: #0C2340;
    height: auto;
    width: auto;
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
        height: 250px;
        width: 530px;
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
</div>
  

    <form class="akhil" action="UpdatePhoneNumServlet" method="post">
    <h2  style="margin-left: 105px;">UPDATE PhoneNumber </h2> <br><br>
        

        <label for="newUsername" style="font-size: 16px;">New PhoneNum:</label>
        <input class="funk"type="text" id="newUsername" style="margin-left: 40px;"name="newUsername" required>

        <button class="sub" type="submit">Update</button>
    </form>
    <div class="footer" style="background-color: #333; color: #fff; text-align: center; padding: 10px; margin: 6px; margin-top: 200px;">
    <p><a href="aboutUs.jsp" style="color: #fff; text-decoration: none;">About Us</a></p>
    <p>Follow Us:</p>
    <a href="https://www.facebook.com/your-facebook-page" style="color: #fff; text-decoration: none; margin: 0 10px;">Facebook</a>
    <!-- Add links to other social media platforms as needed -->
    <p>&copy; Social Security Solution System. All Rights Reserved.</p>
    <img src="copyright.png" alt="Copyright" style="height: 20px;">
</div>
</body>
</html>
