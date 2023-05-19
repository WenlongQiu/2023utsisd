<%-- 
    Document   : alllogs
    Created on : 16-May-2023, 3:15:02 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.log"%>
<%@page import="uts.isd.model.user"%>
<%@page import="uts.isd.model.dao.accesslogdao"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Timestamp" %>
<% 
    user user1 = (user) session.getAttribute("user1");
    accesslogdao dao = new accesslogdao();
    ArrayList<log> logs = dao.showlogs(user1.getEmail());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Logs</title>
    </head>
    <body>
        <div>
            <p>all logs</p>
            <table>
                <tr>
                    <th>Email</th>
                    <th>Time</th>
                    <th>Event</th>
                </tr>
                <% for (log logshows : logs) { %>
                    <tr>
                        <td><%= logshows.getEmail() %></td>
                        <td><%= logshows.getTime() %></td>
                        <td><%= logshows.getLogs() %></td>
                    </tr>
                <% } %>
            </table>
        </div>
    </body>
</html>
