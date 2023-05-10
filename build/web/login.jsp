<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.isd.user" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <%
          user user = (user) session.getAttribute("user");
        %>  
        <h1>Welcome Back!</h1>
        <p>You could login to IoTBay at here...</p>
        <form method="POST" action="welcome.jsp">
            <p>Email Address: <input type="text" id="username" name="username"></p>
            <p>Password: <input type="password" id="password" name="password"></p>
            <input type="submit" value="Submit" name="submit" id="submit">
        </form>
        <p>[ <a href="index.jsp">Back to Homepage</a> ]</p>
    </body>
</html>
