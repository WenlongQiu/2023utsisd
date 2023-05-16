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
        <%  
           
            
            String payErr = (String)session.getAttribute("payErr");
           
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
        
        <form class= "form" action="welcome.jsp" method="post">
            <span style = "color:red;"> <%=(payErr != null ? payErr : "")%> </span>
        <h2>Login</h2>  
        <label>User ID:</label>
	<input type="text" name="userid">
        <label>Password:</label>
	<input type="password" name="password">
        
        <input type="submit" value="Login">
        </form>
        
         
        
        <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
