<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.*" %>
<%@page import="com.isd.*" %>
<%@page import="java.util.*" %>
<%@page import="java.util.Random" %>
<%@page import="uts.isd.model.dao.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Shopping Cart</title>
</head>
<body>
<h1>Hi! You can create & modify a cart here.</h1>
<p>[ <a href="cart.jsp?action=newcart">Create a new shopping cart</a> ]  [ <a href="index.jsp">Back to Homepage</a> ]</p>
<form method="POST" action="cart.jsp">
    <h3>Modify your cart:</h3>
    <p>Insert your cart ID: <input type="text" name="cartid" id="cartid" ></p>
    <input type="submit" name="modifySent" id="modifySent" value="Lookup Cart">
</form>
<%
    String action = request.getParameter("action");
    double totalPrice = 0;
    if ("newcart".equals(action)){
        session.setAttribute("cartid", null);
        session.setAttribute("editing", null);
    }
try {
    DBConnector dbconn = new DBConnector();
    Connection conn = dbconn.openConnection();
    cartDBManager cartDBManager = new cartDBManager(conn);
    String cartid = request.getParameter("cartid");
    if (cartid == null) {
        String cartIDInSession = (String) session.getAttribute("cartid");
        if (cartIDInSession == null) {
            Random random = new Random();
            cartid = String.valueOf(random.nextInt(99999999 - 10000000 + 1) + 10000000); // Random cart id
            session.setAttribute("cartid", cartid);
        } else {
            cartid = cartIDInSession;
        }
    }
%>
<br>
<p>Your cart ID is: <%= cartid %></p>
<form method="POST" action="cart.jsp?cartid=<%= cartid %>">
    <h3>Search item and add to cart</h3>
    <p>Insert device ID or device Name: <input type="text" name="devInfo" id="devInfo"></p>
    <p>Hint: Supports fuzzy search.</p>
    <input type="submit" name="search" id="search" value="search">
</form>
<%
    String searched = request.getParameter("search");
    if (searched != null) {
        String devInfo = request.getParameter("devInfo");
        List<device> searchedItems = cartDBManager.findItems(devInfo);
%>
        <form method="POST" action="addcart.jsp?cartid=<%= cartid %>">
            <table>
                <tr>
                    <td>Device ID</td>
                    <td>Device Name</td>
                    <td>Device Description</td>
                    <td>Left Amount</td>
                    <td>Unit Price</td>
                    <td>Amount for add to cart</td>
                    <td>Total Price</td>
                    <td>Add to cart</td>
                </tr>
<%
                if (!searchedItems.isEmpty()) {
                    for (device device : searchedItems) {
                        String deviceID = device.getDeviceID();
                        String deviceName = device.getDeviceName();
                        String deviceDescription = device.getDeviceDescription();
                        String leftAmount = device.getAmount();
                        String unitPrice = device.getPrice();
%>
                        <tr>
                            <td><input type="text" name="deviceid" id="deviceid" value="<%= deviceID %>" readonly></td>
                            <td><input type="text" name="deviceName" id="deviceName" value="<%= deviceName %>" readonly></td>
                            <td><%= deviceDescription %></td>
                            <td><%= leftAmount %><input type="hidden" name="leftamount" id="leftamount" value="<%= leftAmount %>"></td>
                            <td><input type="text" name="price" id="price" value="<%= unitPrice %>" readonly></td>
                            <td><input type="text" name="amount" id="amount"></td>
                            <td><input type="submit" name="addcart" id="addcart" value="Add to cart"></td>
                        </tr>
<%
                    }
                }
        }
%>
            </table>
        </form>
        <hr>
        <h3>Items in your cart:</h3>
        <table>
            <tr>
                <td>Device ID</td>
                <td>Device Name</td>
                <td>Amount</td>
                <td>Total Price</td>
                <td>Update</td>
                <td>Delete</td>
            </tr>
<%
            List<Cart> cartList = cartDBManager.findCart(cartid);
            if (!cartList.isEmpty()) {
                for (Cart cart : cartList) {
                    String deviceID = cart.getDeviceID();
                    String deviceName = cart.getDeviceName();
                    String unitPrice = cart.getUnitPrice();
                    String cartAmount = cart.getAmount();
                    String cartPrice = cart.getPrice();
                    String token = cart.getToken();
                    totalPrice += Double.parseDouble(cartPrice);
%>
                    <form method="POST" action="modifycart.jsp?cartid=<%= cartid %>">
                        <tr>
                            <td><%= deviceID %></td>
                            <td><%= deviceName %></td>
                            <td><input type="text" name="amount" id="amount" value="<%= cartAmount %>"><input type="hidden" id="price" name="price" value="<%= unitPrice %>"></td>
                            <td>$<%= cartPrice %><input type="hidden" id="token" name="token" value="<%= token %>"></td>
                            <td><input type="submit" name="updateSent" value="Update"></td>
                            <td><a href="delcartitem.jsp?cartid=<%= cartid %>&deviceid=<%= deviceID %>&token=<%= token %>">Delete</a></td>
                        </tr>
                    </form>
<%
                }
            }
%>
        </table>
        <p>Subtotal: $<%= totalPrice %></p>
<%
        if (session.getAttribute("editing") != null){
            String orderid = (String) session.getAttribute("editing");
%>
            <p>[ <a href="editorder.jsp?orderid=<%= orderid %>&cartid=<%= cartid %>&totalprice=<%= totalPrice %>">Save this cart and back to edit order</a> ]</p>
<%
        }
%>
        <p>[ <a href="orderplace.jsp?cartid=<%= cartid %>&totalprice=<%= totalPrice %>">Place a new order based on this cart</a> ]</p>
<%
    } catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
}
%>
</body>
</html>