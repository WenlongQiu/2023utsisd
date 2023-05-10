<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.isd.*" %>
<%@page import="uts.isd.model.dao.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modify cart</title>
</head>
<body>
<%
try {
    DBConnector dbconn = new DBConnector();
    Connection conn = dbconn.openConnection();
    cartDBManager cartDBManager = new cartDBManager(conn);
    String cartid = request.getParameter("cartid");
    String updateSent = request.getParameter("updateSent");
    if (updateSent != null) {
        String token = request.getParameter("token");
        String price = request.getParameter("price");
        String amount = request.getParameter("amount");
        if (price != null && amount != null){
            double totalprice = Double.parseDouble(price) * Integer.parseInt(amount);
            cartDBManager.modifyCart(cartid, String.valueOf(totalprice), token, amount);
        }
        else{ %>
        <p><%= price %>, <%= amount %></p>
   <%   }
%>
<h1>Cart <%= cartid %> has been modified.</h1>
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
