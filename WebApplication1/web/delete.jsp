<%-- 
    Document   : delete
    Created on : 15-May-2023, 10:51:13 PM
    Author     : Dell
--%>
<%@page import="uts.isd.model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
    </head>
    <% 
        user user1 = (user) session.getAttribute("user1");
    %>
    <body>
        <h1>delete account</h1>
        <p>Click the button to delete the account.</p>
        <p>currently logged in:${user1.email}</p>
        <form action="deleteServlet" method="post">
            <p>username(the username is system pre loaded you can not change it)</p>
            <input name="targetdelete" type="text" value="${user1.email}" readonly>
            <p>action</p>
            <input class="Button" type="submit" value="Delete Account" >
        </form>
    </body>
</html>
