<%-- 
    Document   : searchlogs
    Created on : 16-May-2023, 5:00:58 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>search Logs</title>
    </head>
    <body>
        <div>
            <p>search logs</p>
            <form action="searchlogsServlet" method="post">
                <p>Email: You can't change this</p>
                <input name="target" type="text" value="${user1.email}" readonly>
                <p>Start:</p>
                <input type="datetime-local" name="start" id="timestamp">
                <p>End:</p>
                <input type="datetime-local" name="end" id="timestamp">
                <input class="btn" type="submit" value="Search"/>
            </form>
        </div>
    </body>
</html>
