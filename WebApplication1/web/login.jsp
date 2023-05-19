<%-- 
    Document   : Login
    Created on : 15-May-2023, 12:42:28 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <form action="loginServlet" method="post">
            <p>Username:(Your Email Address)</p>
            <input name="email" placeholder="username"/>
            <p>Password</p>
            <input name="password" placeholder="password"/>
            <p>Role</p>
            <select name="role">
                <option value="client">client</option>
                <option value="staff">staff</option>
            </select>
            <input class="btn" type="submit"/>
        </form>
        
    </body>
</html>
