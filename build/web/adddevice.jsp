<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.isd.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="uts.isd.model.dao.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Device</title>
    </head>
    <body>
        <h1>Add Device</h1>
         <% 
            try {
            DBConnector dbconnect = new DBConnector();
            Connection connect = dbconnect.openConnection();
            DeviceDBManager deviceDB = new DeviceDBManager(connect);
            String submitted = request.getParameter("submit");
            ResultSet roles = deviceDB.ifRole("adamjohnson123@example.com");
            String userrole = null;
            if (roles.next()){
                userrole = roles.getString("role");
             }
            Random random = new Random();
            if (submitted != null){
            if (userrole.contains("admin")){
                String deviceID = String.valueOf(random.nextInt(99999999-10000000+1)+10000000);
                String deviceName = request.getParameter("deviceName");
                String deviceDescription = request.getParameter("deviceDescription");
                String amount = request.getParameter("amount");
                String price = request.getParameter("price");
                try {
                    deviceDB.addDevice(deviceID,deviceName,deviceDescription,amount,price);
                    System.out.println("Device added successfully.");
                } catch (SQLException e) {
                    System.out.println("Error adding device: " + e.getMessage());
                }
                %>
                <p>Add complete.</p>
         <%    }} else {
         %>
            <form method="POST" action="adddevice.jsp">
        <p>deviceName:
         <input type="text" id="deviceName" name="deviceName"></p>
        <p>deviceDescription:
        <input type="text" id="deviceDescription" name="deviceDescription"></p>
        <p>amount:
        <input type="text" id="amount" name="amount"></p>
        <p>price:
        <input type="text" id="price" name="price"></p>
       
        <input type="submit" id="submit" name="submit">
    </form>
         <% }}catch (ClassNotFoundException | SQLException e){
            e.printStackTrace(); } %>
    </body>
</html>
