<%-- 
    Document   : landing
    Created on : 15-May-2023, 6:57:50 PM
    Author     : Dell
--%>

<%@page import="uts.isd.model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.dao.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Landing</title>
    </head>
    <% 
        user user1 = (user) session.getAttribute("user1");
    %>
    <body>
        <h1>Logged in</h1>
        <p>Login Details:</p>
        <p>email:${user1.email}</p>
        <p>name:${user1.username}</p>
        <p>role:${user1.work}</p>
        <p>phone:${user1.phone}</p>
        <button><a href="logout.jsp">Logout</a></button>
        <button><a href="delete.jsp">Delete</a></button>
        <button><a href="update.jsp">Update</a></button>
        <button><a href="logs.jsp">All Access Logs</a></button>
        <button><a href="searchlogs.jsp">Search Access Logs</a></button>
    </body>
</html>
