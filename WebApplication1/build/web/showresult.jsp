<%-- 
    Document   : showresult
    Created on : 16-May-2023, 5:50:29 AM
    Author     : Dell
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.log"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search result</title>
    </head>
    <body>
        <div>
            <table>
                <tr>
                    <th>Email</th>
                    <th>Time</th>
                    <th>Event</th>
                </tr>
                <% for (log logdetails : (ArrayList<log>)request.getAttribute("searchresult")) { %>
                <tr>
                    <td><%= logdetails.getEmail() %></td>
                    <td><%= logdetails.getTime() %></td>
                    <td><%= logdetails.getLogs() %></td>
                </tr>
                <% } %>
            </table>
        </div>
    </body>
</html>
