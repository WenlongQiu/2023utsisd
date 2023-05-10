<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.isd.user" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logout Page</title>
    </head>
    <body>
        <%
            session.invalidate();
        %>
        <h1>You have logged out. Thanks for login.</h1>
        <p><a href="index.jsp">Click here to homepage</a></p>
</form> 
    </body>
</html>
