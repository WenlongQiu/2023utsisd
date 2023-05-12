<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.isd.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="uts.isd.model.dao.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <p> <a href ="index.jsp"> go back to home page</a></p><!-- comment -->
         <p> <a href ="placeorder.jsp"> go back to the order page</a></p>
          
        <% 
            try {
                DBConnector dbconnect = new DBConnector();
                Connection connect = dbconnect.openConnection();
                DeviceDBManager deviceDB = new DeviceDBManager(connect);
                ResultSet roles = deviceDB.ifRole("adamjohnson123@example.com");
                String userrole = null;
                if (roles.next()){
                    userrole = roles.getString("role");
                }
                ResultSet result = deviceDB.listDevice(); 
        %>
            <table>
                <tr>
                    <th>Device ID</th>
                    <th>Device Name</th>
                    <th>Device Description</th>
                    <th>Amount</th>
                    <th>Price</th>
                    <th>Delete</th>
                </tr>
        <%    
            if (result != null ) {
                while (result.next()) {
        %>
                    <tr>
                        <td><%= result.getString("deviceID") %></td>
                        <td><%= result.getString("deviceName") %></td>
                        <td><%= result.getString("deviceDescription") %></td>
                        <td><%= result.getString("amount") %></td>
                        <td><%= result.getString("price") %></td>
                        <% if(userrole != null && userrole.equals("admin")) { %>
                            <td><a href="deletedevice.jsp?deviceid=<%=result.getString("deviceID")%>">Delete</a></td>
                        <% } %>
                    </tr>
        <%         }
            } else {
                out.println("Result set is null");
            }
    
        %>
            <% if(userrole != null && userrole.equals("admin")) { %>
            <p><a href="adddevice.jsp">Add device</a></p>
            <% } } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } %>
    </table>
    </body>
</html>
