<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.isd.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="uts.isd.model.dao.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Device</title>
    </head>
    <body>
        <h1>Edit Device</h1>
        <% 
            try {
                DBConnector dbconnect = new DBConnector();
                Connection connect = dbconnect.openConnection();
                DeviceDBManager deviceDB = new DeviceDBManager(connect);
                String deviceID = request.getParameter("deviceid");
                ResultSet rs = deviceDB.findDeviceDetails(deviceID);
                ResultSet roles = deviceDB.ifRole("adamjohnson123@example.com");
                String userrole = null;
                if (roles.next()){
                    userrole = roles.getString("role");
                }
                String submitted = request.getParameter("submit");
                if (deviceID != null){
                    if (userrole.equals("admin")) {
                        if (submitted != null){
                            String deviceName = request.getParameter("deviceName");
                            String deviceDescription = request.getParameter("deviceDescription");
                            String amount = request.getParameter("amount");
                            String price = request.getParameter("price");
                            deviceDB.updateDevice(deviceID, deviceName, deviceDescription, amount, price);
        %>
                            <p>Edit complete.</p>
                            <p><a href="listdevice.jsp">click here to go back</a></p>
        <%                  }
        %>
                            <form method="POST" action="editdevice.jsp?deviceid=<%= deviceID %>">
                                <p>Device Name:
                                    <input type="text" id="deviceName" name="deviceName" value="<%= rs.getString("deviceName") %>">
                                </p>
                                <p>Device Description:
                                    <input type="text" id="deviceDescription" name="deviceDescription" value="<%= rs.getString("deviceDescription") %>">
                                </p>
                                <p>Amount:
                                    <input type="text" id="amount" name="amount" value="<%= rs.getString("amount") %>">
                                </p>
                                <p>Price:
                                    <input type="text" id="price" name="price" value="<%= rs.getString("price") %>">
                                </p>
                                <input type="submit" name="submit" value="Submit">
                            </form>
        <%              } else { %>
                        <p>Error <a href="listdevice.jsp">go back</a></p>


<% }
                    } else {
        %>
                        <p>Error <a href="listdevice.jsp">go back</a></p>
        <%          }
                } 
             catch (ClassNotFoundException | SQLException e){
                e.printStackTrace();
            }
        %>
    </body>
</html> 
