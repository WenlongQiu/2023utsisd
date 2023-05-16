<%-- 
    Document   : logout
    Created on : 30 Apr 2023, 3:25:32 pm
    Author     : xiaobing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/style.css">
        <title>JSP Page</title>
    </head>
    <body>
         <div class="header">
             <h1>IoTBay</h1>
         </div>
         
              <div class="menu">
            <a href="#">Home</a>
            <a href="#">Products</a>
            <a href ="main.jsp">Main</a>
            <a href ="index.jsp">Order</a>
            <a href ="PaymentServlet">Payment</a>
            <a style="float:right" href="logout.jsp">Logout</a>
            <a style="float:right" href="login.jsp">Login</a>
        </div>
        <br>
    <center>
        Click <a href="login.jsp">here</a> to login!
    </center>
        <% session.invalidate();%>
    </body>
</html>
