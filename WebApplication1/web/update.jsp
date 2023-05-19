<%-- 
    Document   : update
    Created on : 16-May-2023, 12:34:09 AM
    Author     : Dell
--%>
<%@page import="uts.isd.model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update information</title>
    </head>
    <% 
        user user1 = (user) session.getAttribute("user1");
    %>
    <body>
        <p>Once update ok you have to login again to the changes</p>
        <form action="updateServlet" method="post">
            <p>Email: You can't change email</p>
            <input name="newemail" type="text" value="${user1.email}" readonly>
            <p>Name:</p>
            <input name="newname" type="text">
            <p>Role: You can't change role</p>
            <input name="newwork" type="text" value="${user1.work}" readonly>
            <p>Password:</p>
            <input name="newpassword" type="text">
            <p>Phone:</p>
            <input name="newphone" type="text">
            <input class="Button" type="submit" value="Update" >
        </form>
    </body>
</html>
