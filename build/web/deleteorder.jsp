<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.isd.*" %>
<%@page import="uts.isd.model.dao.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel your order</title>
    </head>
    <body>
        <%
            DBConnector dbconn = new DBConnector();
            Connection conn = dbconn.openConnection();
            OrderDBManager orderDBManager = new OrderDBManager(conn);
            String orderid = request.getParameter("orderid");
            if (orderid != null){
                orderDBManager.deleteOrder(orderid);
        %>
        <h1>Your order <%= orderid %> has been cancelled.</h1>
        <p>You can place a new order now.</p>
        <p>[ <a href="orderquery.jsp">Back to previous page</a> ]</p>
        <% 
            } else { %>
            <h1>Invalid argument!</h1>
            <p>[ <a href="orderquery.jsp">Back to previous page</a> ]</p>
        <% } 
        %>
    </body>
</html>
