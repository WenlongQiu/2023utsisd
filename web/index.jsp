<%-- 
    Document   : index
    Created on : 27 Apr 2023, 12:51:15 pm
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
        
        <form class= "form" action="OrderServlet" method="post">
         
        <h2>Order Detail</h2>
        Order ID: <input type="text" name="orderid"><br>
    
        Amount: <input type="text" name="amount"><br>
        <input type="submit" value="pay">
        </form>
        </div>
        
        <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
