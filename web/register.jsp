<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.isd.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
       
        <h1>Thanks for registering.</h1>
        <form method="POST" action="reg-welcome.jsp">
        <p>email:
         <input type="text" id="email" name="email"></p>
        <p>Hint: The email will becomes your login id and User ID.</p>
        <p>Full Name:
         <input type="text" id="name" name="name"></p>
        <p>Password:
        <input type="password" id="password" name="password"></p>
        <p>address:
        <input type="text" id="address" name="address"></p>
        <p>I agree with terms of service:
            <input type="checkbox" id="tos" name="tos"> </p>
        <input type="submit" id="submit" name="submit">
    </form>
        <p>[ <a href="index.jsp">Back to Homepage</a> ]</p>
  
    </body>
</html>
