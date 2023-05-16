<%-- 
    Document   : payment
    Created on : 27 Apr 2023, 10:54:38 am
    Author     : xiaobing
--%>

<%@page import="uts.isd.model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Payment Form</title>
	<link rel="stylesheet" type="text/css" href="CSS/style.css">
</head>
<body>
        <%  
            //Order order = (Order)session.getAttribute("order");
            Payment payment = (Payment)session.getAttribute("payment");
            String cardErr = (String)session.getAttribute("cardErr");
            String nameErr = (String)session.getAttribute("nameErr");
            String expErr = (String)session.getAttribute("expErr");
            String cvvErr = (String)session.getAttribute("cvvErr");
         %>
         
        <div class="header">
             <h1>IoTBay</h1>
         </div>
         
         <div class="menu">
        <a href="#">Home</a>
            <a href="#">Products</a>
            <a href ="main.jsp">Main</a>
            <a href ="index.jsp">Order</a>
            <a href ="PaymentServlet">Payment</a>
            <a style="float:right" href="logout.jsp">Logout</a>
            <a style="float:right" href="login.jsp">Login</a>
        </div>
	<form class = "form" action="UpdatePaymentServlet" method="post">
            <h1>
                Payment Details
            </h1>
   
                <label>Card Number <br><span class = "err"> <%=(cardErr != null ? cardErr : "")%> </span> </label>
		<input type="text" value= "${payment.getCardNo()}" id="cardNo" name="cardNo">
		<label>Cardholder Name <br><span class = "err"> <%=(nameErr != null ? nameErr : "")%> </span></label>
		<input type="text" value= "${payment.getCardHolder()}" id="cardHolder" name="cardHolder">
		<label>Expiry <br><span class = "err"> <%=(expErr != null ? expErr : "")%> </span></label>
		<input type="text" value= "${payment.getExpiry()}" id="exp" name="cardExp">
		<label>CVV<br><span class = "err"> <%=(cvvErr != null ? cvvErr : "")%> </span></label>
		<input type="text" value= "${payment.getCVV()}" id="cvv" name="cvv">
		
                <input type="submit" name = "submit" value="Save">
                <input type="submit" name = "submit" value="Pay">
	</form>
              
</body>
</html>