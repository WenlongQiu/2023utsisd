<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.isd.*" %>
<%@page import="uts.isd.model.dao.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Item</title>
    </head>
    <body>
        <%
        try {
            DBConnector dbconn = new DBConnector();
            Connection conn = dbconn.openConnection();
            cartDBManager cartDBManager = new cartDBManager(conn);
            String cartid = request.getParamter("cartid");
            String deviceid = request.getParameter("deviceid");
            if (deviceid != null || cartid != null){
                cartDBManager.delItem(cartid,deviceid); // Invoke the non-static method on the instance
        %>
        <h1>Your item <%= deviceid %> has been deleted.</h1>
        <p>[ <a href="javascript:history.back()">Back to shopping cart</a> ]</p>
        <% 
            } else { %>
            <h1>Invalid argument!</h1>
            <p>[ <a href="javascript:history.back()">Back to shopping cart</a> ]</p>
        <% }} catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } 
        %>
    </body>
</html>