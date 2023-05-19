<%-- 
    Document   : mainone
    Created on : May 3, 2023, 2:21:48 PM
    Author     : Leo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>User Registration</title>
</head>
<body>
  <h2>User Registration</h2>
  <form action="loginServletTry" method="POST">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br>


    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>


    <input type="submit" value="login" >
  </form>
</body>
</html>
