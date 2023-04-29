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
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
        <%  
            Order order = (Order)session.getAttribute("order");
            Payment payment = (Payment)session.getAttribute("payment");
            String cardErr = (String)session.getAttribute("cardErr");
            String nameErr = (String)session.getAttribute("nameErr");
            String expErr = (String)session.getAttribute("expErr");
            String cvvErr = (String)session.getAttribute("cvvErr");
         %>
	<form action="UpdatePaymentServlet" method="post">
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
		
                <input type="submit" value="Save">
	</form>
               
</body>
</html>