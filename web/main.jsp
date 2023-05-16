<%-- 
    Document   : main
    Created on : 30 Apr 2023, 12:45:33 pm
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
          <div class="product-card">
        <img src="product-image.jpg" alt="Product Image" width="200" height="200">
        <h3>Product Name</h3>
        <p>Product description goes here...</p>
        <button>Add to Cart</button>
        </div>
        
       
    </body>
</html>
