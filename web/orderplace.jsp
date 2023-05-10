<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.isd.*" %>
<%@page import="java.util.Random" %>
<%@page import="uts.isd.model.dao.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<%
    String cartid = request.getParameter("cartid");
    String totalprice = request.getParameter("totalprice");
    String cart = null;
    if (cartid != null){
        cart = cartid;
    }
    try{
    user user = (user) session.getAttribute("user");
    String submitted = request.getParameter("submit");
    Random random = new Random();
    String amount = Double.toString(0.0);
    String userid = user.getUserID();
    DBConnector dbconn = new DBConnector();
    Connection conn = dbconn.openConnection();
    OrderDBManager orderDBManager = new OrderDBManager(conn);
    if (submitted != null) {
             String name = request.getParameter("name");
             String address = request.getParameter("address");
             String phonenum = request.getParameter("phonenum");
             String status = request.getParameter("orderAction");
             amount = request.getParameter("totalprice");
             if (phonenum.matches("\\d+") && phonenum.length() < 20){
             String orderid = String.valueOf(random.nextInt(99999999-10000000+1)+10000000); // Random order id
             Date currentDate = new Date();
             SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
             String orderDate = dateFormat.format(currentDate);
             orderDBManager.placeOrder(orderid, userid, orderDate, cartid, amount, name, address, phonenum, status);
             session.setAttribute("cartid",null);
                %>
                    <h1>Order #<%= orderid %> has been successfully <%= status %>.</h1>
                    <p>[ <a href="index.jsp">Back to Homepage</a> ]</p>
                <%
            } else { %>
                <p>You have input a wrong phone number. Click <a href="javascript:history.back()">here</a> to modify.</p>
    <%      }
            } else {
                if (session.getAttribute("logged") != null) {
        %>
        <h1>Order Place System</h1>
        <p>[ <a href="cart.jsp?cartid=<%= cart %>">Back to previous page</a> ]</p>
        <form method="POST" action="orderplace.jsp">
            <h3>Account Information: </h3>
            <p>Your user ID: <input type="text" id="accnum" name="accnum" value="<%= userid %>" readonly></p>
            <p>Your cart ID: <input type="text" id="cartid" name="cartid" value="<%= cart %>" readonly></p>
            <p>Total Price: <input type="text" id="totalprice" name="totalprice" value="<%= totalprice %>" readonly></p>
            <p>Do you want to edit your cart? <a href="cart.jsp?cartid=<%= cart %>">Click here for edit!</a></p>
            <h3>Shipping information: </h3>
            <p>Your name: <input type="text" id="name" name="name"></p>
            <p>Your Address: <input type="text" id="address" name="address"></p>
            <p>Your Phone Number: <input type="text" id="phonenum" name="phonenum"></p>
            <p>Order Action: <select name="orderAction">
                <option value="saved">Save order</option>
                <option value="placed">Place directly</option>
            </select></p>
            <p>Please note that all place directly order cannot be modified after submission.</p>
            <input type="submit" name="submit" id="submit">
        </form>
        <% } else { %>
        <p>You haven't login. Click <a href="login.jsp">Here</a> to login.</p>
   <%      }
    }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>
    </body>
</html>
