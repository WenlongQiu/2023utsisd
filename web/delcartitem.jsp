<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.isd.*" %>
<%@page import="uts.isd.model.dao.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove item from cart</title>
    </head>
    <body>
        <%
        try {
            DBConnector dbconn = new DBConnector();
            Connection conn = dbconn.openConnection();
            cartDBManager cartDBManager = new cartDBManager(conn);
            String cartid = request.getParameter("cartid");
            String deviceid = request.getParameter("deviceid");
            if (cartid != null){
                String token = request.getParameter("token");
                cartDBManager.delItem(token);
        %>
        <h1>Item <%= deviceid %> has been removed from cart <%= cartid %>.</h1>
        <p>Your order will be processed soon.</p>
        <p>[ <a href="cart.jsp?cartid=<%= cartid %>">Back to previous page</a> ]</p>
        <% 
            } else { %>
            <h1>Invalid argument!</h1>
            <p>[ <a href="cart.jsp?cartid=<%= cartid %>">Back to previous page</a> ]</p>
        <% }} catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } 
        %>
    </body>
</html>