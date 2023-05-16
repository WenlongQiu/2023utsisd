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
            <a href ="main.jsp">main</a>
            <a href ="PaymentServlet">Payment</a>
            <a href="login.jsp">login</a>
            <a href="logout.jsp">logout</a>
        </div>
        Click <a href="login.jsp">here</a> to login!
        <% session.invalidate();%>
    </body>
</html>
