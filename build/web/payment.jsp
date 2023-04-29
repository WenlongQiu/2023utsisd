<%-- 
    Document   : payment
    Created on : 27 Apr 2023, 9:34:11 pm
    Author     : xiaobing
--%>

<%@page import="uts.isd.model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  Order order = (Order)session.getAttribute("order");
        CardInfo cardInfo = (CardInfo)session.getAttribute("cardInfo");
        int cardID = (Integer)session.getAttribute("cardID");
            
                    %>
                    
                    <h1>
                Payment
            </h1>
            <p>Order ID: <%= order.getOrderID()%></p>
         
            <p>Amount: <%=order.getAmount()%></p>
            <p>Card Number: <%=cardInfo.getCardNo()%></p>
            <p>Card ID <%=cardID%></p>
            
            <a class = "button" href="EditPaymentServlet?cardID=<%=cardID%>">edit</a>
            <a class = "button" href="DeleteCardServlet">delete</a>
            <a class = "button" href="ViewPayment">view history</a>
            
            
            
                 
     
	</form>
</body>
</html>