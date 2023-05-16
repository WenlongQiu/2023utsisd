<%-- 
    Document   : welcome
    Created on : 16 May 2023, 4:00:12 pm
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
        <%  int userID = Integer.parseInt(request.getParameter("userid"));
            session.setAttribute("userID", userID);
            %>
                    
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
    <center>
        <h1>Login successful!</h1>
       
        <br>
    
        Click <a href ="index.jsp">here</a> to continue payment
    </center>
    </body>
</html>
