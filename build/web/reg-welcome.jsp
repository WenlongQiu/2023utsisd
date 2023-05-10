<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.isd.*" %>
<%@page import="uts.isd.model.*" %>
<%@page import="uts.isd.model.dao.*" %>
<%@page import="java.util.Random" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Complete - Welcome - IoT Bay</title>
    </head>
    <body>
 <%
     try {
            String submitted = request.getParameter("submit");
            if (submitted != null){
                DBConnector dbconn = new DBConnector();
                Connection conn = dbconn.openConnection();
                OrderDBManager orderDBManager = new OrderDBManager(conn);
                String userid = request.getParameter("email");
                String name = request.getParameter("name");
                String password = request.getParameter("password");
                String address = request.getParameter("address");
                String ifAgreeTOS = request.getParameter("tos");
                if (ifAgreeTOS != null){
                    if (userid.contains("@")){
                        user u = new user(userid,name,password,address,ifAgreeTOS);
//                      userDBManager.adduser(userid,name,password,email,address,ifAgreeTOS);
                        session.setAttribute("user", u); 
%>
                    <div>
                        <h2>Register Complete. </h2>
                        <p>Here is your user information: </p>
                        <p>Email: <%= userid %></p>
                        <p>Full Name: <%= name %></p>
                        <p>Password: <%= password %></p>
                        <p>Address: <%= address %></p>
                        <p>Agree with ToS: <%= ifAgreeTOS %></p>
                        <p>Click <a href="index.jsp">here</a> to homepage.</p>
                    </div>
            <%      } else { %>
                        <p>There is one or more information is invalid. Please click <a href="javascript:history.back()">here</a> to modify.</p>
            <%      }
             
                }
                else { %>
                    <p>You did not agree with our Terms of Service!</p>
                    <p>Click <a href="javascript:history.back();">Here</a> to modify your registration.</p>
        <%      }
            } else {
        %>
                <p>Unauthorized Access!</p>
        <% } } catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
} %>
    </body>
</html>
