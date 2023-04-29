<%-- 
    Document   : index
    Created on : 27 Apr 2023, 12:51:15 pm
    Author     : xiaobing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="OrderServlet" method="post">
        <h2>Order Detail</h2>
        Order ID: <input type="text" name="orderid"><br>
        User ID: <input type="text" name="userid"><br>
        Amount: <input type="text" name="amount"><br>
        <input type="submit" value="pay">
        </form>
        <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
