<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.isd.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.List" %>
<%@page import="uts.isd.model.*" %>
<%@page import="uts.isd.model.dao.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View your order</title>
</head>
<body>
<h1>View your saved orders here.</h1>
<p>[ <a href="index.jsp">Back to welcome page</a> ]</p>
<p>[ <a href="orderquery.jsp">Saved Order</a> ] [ <a href="placedorder.jsp">Placed Order</a> ]</p>
<p>[ <a href="cart.jsp">Create a new order</a> ]</p>
<form method="POST" action="orderquery.jsp">
    <h3>Search your order</h3>
    <p>Insert your order number: <input type="text" id="queryOrderID" name="queryOrderID"></p>
    <p>Insert your order date (dd/mm/YYYY): <input type="text" id="queryOrderDate" name="queryOrderDate"></p>
    <input type="submit" name="submit" id="submit">
    <a href="orderquery.jsp">Reset Filter</a>
</form>
<br>
<h4>Note: Here are all saved orders.<br></h4>
<h4>You could click on "Confirm order" to final submission. <br>All final submitted orders cannot be modified.</h4>
<%
    try {
        user user = (user) session.getAttribute("user");
        if (user != null) {
            DBConnector dbconn = new DBConnector();
            Connection conn = dbconn.openConnection();
            OrderDBManager orderDBManager = new OrderDBManager(conn);
            String submitted = request.getParameter("submit");
            if (submitted != null) {
                String orderid = request.getParameter("queryOrderID");
                String orderdate = request.getParameter("queryOrderDate");
                String status = "saved";
                List<order> findOrder = orderDBManager.findOrder(orderid, orderdate, status);
                if (!findOrder.isEmpty()) {
%>
<table border="1">
    <tr>
        <th>Order Number</th>
        <th>User ID</th>
        <th>Placed Date</th>
        <th>Cart ID</th>
        <th>Total Price</th>
        <th>Status</th>
        <th>Edit Order</th>
        <th>Confirm Order</th>
        <th>Cancel Order</th>
    </tr>
<% for (order order : findOrder) { %>
    <tr>
        <td><%= order.getOrderID() %></td>
        <td><%= order.getUserID() %></td>
        <td><%= order.getOrderDate() %></td>
        <td><%= order.getCartID() %></td>
        <td>$<%= order.getAmount() %></td>
        <td><%= order.getStatus() %></td>
        <td><a href="editorder.jsp?orderid=<%= order.getOrderID() %>">Edit Order</a></td>
        <td><a href="confirmorder.jsp?orderid=<%= order.getOrderID() %>">Confirm Order</a></td>
        <td><a href="deleteorder.jsp?orderid=<%= order.getOrderID() %>">Cancel Order</a></td>
    </tr>
<% } %>
</table>
<%
                } else {
%>
<p>Cannot find the specified order.</p>
<%
                }
            } else {
                String userid = user.getUserID();
                List<order> orderList = orderDBManager.findAllOrder(userid, "saved");
                if (!orderList.isEmpty()) {
%>
<table border="1">
    <tr>
        <th>Order Number</th>
        <th>User ID</th>
        <th>Placed Date</th>
        <th>Cart ID</th>
        <th>Amount</th>
        <th>Total Price</th>
        <th>Edit Order</th>
        <th>Confirm Order</th>
        <th>Cancel Order</th>
    </tr>
<% for (order order : orderList) { %>
    <tr>
        <td><%= order.getOrderID() %></td>
        <td><%= order.getUserID() %></td>
        <td><%= order.getOrderDate() %></td>
        <td><%= order.getCartID() %></td>
        <td>$<%= order.getAmount() %></td>
        <td><%= order.getStatus() %></td>
        <td><a href="editorder.jsp?orderid=<%= order.getOrderID() %>">Edit Order</a></td>
        <td><a href="confirmorder.jsp?orderid=<%= order.getOrderID() %>">Confirm Order</a></td>
        <td><a href="deleteorder.jsp?orderid=<%= order.getOrderID() %>">Cancel Order</a></td>
    </tr>
<% } %>

</table>
<%
                } else {
%>
<p>Could not find any order from the system.</p>
<%
                }
            }
            conn.close();
        } else {
%>
<p>Please login to view your orders.</p>
<%
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>