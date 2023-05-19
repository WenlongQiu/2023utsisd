<%-- 
    Document   : index
    Created on : 15-May-2023, 12:41:03 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage</title>
    </head>
    <body>
        <h1>home</h1>
        <div>
            <button><a href="login.jsp">Login</a></button>
            <button><a href="register.jsp">Register</a></button>
        </div>
        <jsp:include page="/ConnServlet" flush="ture" />
    </body>
</html>
