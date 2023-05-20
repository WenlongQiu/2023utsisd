<%-- 
    Document   : payment
    Created on : 27 Apr 2023, 9:34:11 pm
    Author     : xiaobing
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/style.css">
        <title>payment</title>
    </head>
<body>
    
    <%  //ArrayList<Payment> payments = (ArrayList)session.getAttribute("payments");
        %>
         <div class="header">
             <h1>IoTBay</h1>
         </div>
         
         <div class="menu">
        <a href="#">Home</a>
            <a href="#">Products</a>
            <a href ="main.jsp">Main</a>
            <a href ="orderquery.jsp">Order</a>
            <a href ="PaymentServlet">Payment</a>
            <a style="float:right" href="logout.jsp">Logout</a>
            <a style="float:right" href="login.jsp">Login</a>
        </div>

    
        <p align="right">
            
            
            <a href="PaymentHistoryServlet">List History Payments</a>
             
        </p>
   
    <div align="center">
        <table class="table">
            <caption><h2>List of Saved Payments</h2></caption>
            <tr>
                <th>Payment ID</th>
                <th>Order ID</th>
                <th>Amount</th>
                <th>Payment Method</th>
                <th>Card Number</th>
                <th>Date</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="payment" items="${payments}">
                <tr>
                    <td><c:out value="${payment.getPaymentID()}" /></td>
                    <td><c:out value="${payment.getOrderID()}" /></td>
                    <td><c:out value="${payment.getAmount()}" /></td>
                    <td><c:out value="${payment.getPaymentMethod()}" /></td>
                    <td><c:out value="${payment.getCardNo()}" /></td>
                    <td><c:out value="${payment.getPaymentDate()}" /></td>
                    <td>
                        <a href="EditPaymentServlet?paymentID=<c:out value='${payment.getPaymentID()}' />">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="DeletePaymentServlet?paymentID=<c:out value='${payment.getPaymentID()}' />">Delete</a>
                        <%--<form action="DeletePaymentServlet">
                            <input type="submit" name = "delete" value="Delete">
                            <input type="hidden" name = "paymentID" value="${payment.getPaymentID()}">
                        </form>
                        --%>
                        
                        
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>   

</body>
</html>
