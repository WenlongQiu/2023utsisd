<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Random" %>
<%@page import="uts.isd.model.dao.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Submit</title>
    </head>
    <body>
        <%
        try {
            DBConnector dbconn = new DBConnector();
            Connection conn = dbconn.openConnection();
            OrderDBManager orderDBManager = new OrderDBManager(conn);
            String submitted = request.getParameter("submit");
            if (submitted != null) {
                String orderid = request.getParameter("orderid");
                String cartid = request.getParameter("cartid");
                String amount = request.getParameter("amount");
                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String phonenum = request.getParameter("phonenum");
                if (phonenum.matches("\\d+") && phonenum.length() < 20){
                orderDBManager.updateOrder(orderid, cartid, name, amount, address, phonenum);
                session.setAttribute("editing",null);
        %>
        <h1>Your order update has been submitted.</h1>
        <p>[ <a href="orderquery.jsp">Back to previous page</a> ]</p>
        <%   }

        } else { %>
        <p>Invalid argument!</p>
        <p>[ <a href="orderquery.jsp">Back to previous page</a> ]</p>
        <%    }} catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
}
        %>
    </body>
</html>
