<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="com.isd.*" %>
<%@page import="java.util.Random" %>
<%@page import="uts.isd.model.dao.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Order</title>
</head>
<body>
<h1>Edit your order.</h1>
<p>[ <a href="orderquery.jsp">Back to previous page</a> ]</p>
<%
    try {
        DBConnector dbconn = new DBConnector();
        Connection conn = dbconn.openConnection();
        OrderDBManager orderDBManager = new OrderDBManager(conn);
        String orderid = request.getParameter("orderid");
        if (orderid != null) {
            List<order> orderDetails = orderDBManager.readOrderDetails(orderid);
            if (!orderDetails.isEmpty()) {
                order order = orderDetails.get(0);
                String userid = order.getUserID();
                String orderDate = order.getOrderDate();
                String cartid = order.getCartID();
                String amount = order.getAmount();
                String name = order.getName();
                String address = order.getAddress();
                String phonenum = order.getPhonenum();
                String orderStatus = order.getStatus();
                session.setAttribute("editing", orderid);
%>
<form method="POST" action="submitedit.jsp">
    <p>Order ID: <%= orderid %><input type="hidden" name="orderid" id="orderid" value="<%= orderid %>"></p>
    <p>Order Date: <%= orderDate %></p>
    <p>Note: You cannot change order ID and order date.</p>
    <p>You could click on Cart ID to edit the cart.</p>
    <p>Cart ID: <a href="cart.jsp?orderid=<%= orderid %>&cartid=<%= cartid %>"><%= cartid %><input type="hidden" name="cartid" id="cartid" value="<%= cartid %>"></a></p>
    <p>Price due today: <input type="text" name="amount" id="amount" value="<%= amount %>" readonly></p>
    <p>Full Name: <input type="text" name="name" id="name" value="<%= name %>"></p>
    <p>Address: <input type="text" name="address" id="address" value="<%= address %>"></p>
    <p>Phone Number: <input type="text" name="phonenum" id="phonenum" value="<%= phonenum %>"></p>
    <input type="submit" name="submit" id="submit">
</form>
<%
    } else {
%>
<p>No order details found for the given order ID.</p>
<%
    }
} else {
%>
<p>Invalid argument.</p>
<%
}
} catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
}
%>
</body>
</html>
