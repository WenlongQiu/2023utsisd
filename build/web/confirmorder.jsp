<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.isd.*" %>
<%@page import="uts.isd.model.dao.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm your order</title>
    </head>
    <body>
        <%
        try {
            DBConnector dbconn = new DBConnector();
            Connection conn = dbconn.openConnection();
            OrderDBManager orderDBManager = new OrderDBManager(conn);
            String orderid = request.getParameter("orderid");
            if (orderid != null){
                orderDBManager.confirmOrder(orderid); // Invoke the non-static method on the instance
        %>
        <h1>Your order <%= orderid %> has been confirmed.</h1>
        <p>Your order will be processed soon.</p>
        <p>[ <a href="orderquery.jsp">Back to previous page</a> ]</p>
        <% 
            } else { %>
            <h1>Invalid argument!</h1>
            <p>[ <a href="orderquery.jsp">Back to previous page</a> ]</p>
        <% }} catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } 
        %>
    </body>
</html>