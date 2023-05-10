<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.isd.*" %>
<%@page import="java.util.Random" %>
<%@page import="uts.isd.model.dao.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add cart</title>
    </head>
    <body>
        <%
        try {
            DBConnector dbconn = new DBConnector();
            Connection conn = dbconn.openConnection();
            cartDBManager cartDBManager = new cartDBManager(conn);
            Random random = new Random();
            String cartid = request.getParameter("cartid");
            if (cartid != null){
                String deviceid = request.getParameter("deviceid");
                String deviceName = request.getParameter("deviceName");
                String price = request.getParameter("price");
                String amount = request.getParameter("amount");
                String leftamount = request.getParameter("leftamount");
                if (amount.matches("\\d+") && Integer.parseInt(amount) <= Integer.parseInt(leftamount)){
                    double totalprice = Double.parseDouble(price) * Integer.parseInt(amount);
                    String token = String.valueOf(random.nextInt(99999999 - 10000000 + 1) + 10000000); // Random cart item token
                    cartDBManager.addCart(cartid, deviceid, deviceName, price, String.valueOf(totalprice), amount, token); %>
                    <h1>Item <%= deviceid %> has been added to cart <%= cartid %>.</h1>
                    <p>[ <a href="cart.jsp?cartid=<%= cartid %>">Back to previous page</a> ]</p>
        <%        } else { %>
                    <p>You have inserted a wrong amount. Press <a href="javascript:history.back()">here</a> to modify.</p>
        <%        }
            } else { %>
            <h1>Invalid argument!</h1>
            <p>[ <a href="cart.jsp?cartid=<%= cartid %>">Back to previous page</a> ]</p>
        <% }} catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } 
        %>
    </body>
</html>