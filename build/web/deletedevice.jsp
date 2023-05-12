<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.isd.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="uts.isd.model.dao.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Device</title>
    </head>
    <body>
        <h1>Delete Device</h1>
        <%
        try {
            DBConnector dbconnect = new DBConnector();
            Connection connect = dbconnect.openConnection();
            DeviceDBManager deviceDB = new DeviceDBManager(connect);
            String deviceid = request.getParameter("deviceid");
            ResultSet roles = deviceDB.ifRole("adamjohnson123@example.com");
                String userrole = null;
                if (roles.next()){
                    userrole = roles.getString("role");
                }
            if (deviceid != null){
            if (userrole.contains("admin")){
            
                deviceDB.deleteDevice(deviceid); %>
                <p>Delete complete.</p>
       <%     }}
            else { %> 
            <p> error!</p>
            <% }} catch (ClassNotFoundException | SQLException e){
            e.printStackTrace(); } %>
    </body>
</html>
