<%-- 
    Document   : register
    Created on : 15-May-2023, 12:49:37 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>register</title>
    </head>
    <body>
        <h1>Register</h1>
        <form action="registerServlet" method="post">
            <p>Name:</p>
            <input name="name" type="text" placeholder="name">
            <p>Email:</p>
            <input name="email" type="text" placeholder="email(will be username)">
            <p>Phone:</p>
            <input name="phone" type="text" placeholder="phone">
            <p>Password:</p>
            <input name="password" type="password" placeholder="password">
            <p>Role</p>
            <select name="role" id="option1" name="option1">
                <option value="client">client</option>
                <option value="staff">staff</option>
            </select>
             <input type="submit" value="submit">
        </form>
    </body>
</html>
