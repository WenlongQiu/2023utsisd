<%-- 
    Document   : logout
    Created on : 15-May-2023, 6:59:34 AM
    Author     : Dell
--%>
<%@page import="uts.isd.model.user"%>
<%@page import="uts.isd.model.dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log out</title>
    </head>
    <body>
        <h1>Click to Logout!</h1>
        <form action="logoutServlet" method="post">
            <p>The Email that you want are going to logout! You can't change that</p>
            <input name="email" type="text" value="${user1.email}" readonly>
            <button type="submit">Logout</button>
        </form>
    </body>
</html>
