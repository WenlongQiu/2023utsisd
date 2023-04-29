<%-- 
    Document   : payment
    Created on : 27 Apr 2023, 10:54:38 am
    Author     : xiaobing
--%>

<%@page import="uts.isd.model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Payment Form</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
        <%  
            Order order = (Order)session.getAttribute("paymentorder");
            
            String cardErr = (String)session.getAttribute("cardErr");
            String nameErr = (String)session.getAttribute("nameErr");
            String expErr = (String)session.getAttribute("expErr");
            String cvvErr = (String)session.getAttribute("cvvErr");
         %>
	<form action="CardInfoServlet" method="post">
            <h1>
                ORDER
            </h1>
            <p>Order ID: <%= order.getOrderID()%></p>
         
            <p>Amount: $<%=order.getAmount()%></p>
		<h2>Credit Card Details:</h2>
               
                <label >Payment Method:</label>
		<select name="payMethod">
			<option value="credit">Credit Card</option>
			
		</select>
                <label>Card Number <br><span class = "err"> <%=(cardErr != null ? cardErr : "")%> </span> </label>
		<input type="text" placeholder="Enter card number" id="cardNo" name="cardNo">
		<label>Cardholder Name <br><span class = "err"> <%=(nameErr != null ? nameErr : "")%> </span></label>
		<input type="text" placeholder="Enter cardholder name" id="cardHolder" name="cardHolder" required>
		<label>Expiry <br><span class = "err"> <%=(expErr != null ? expErr : "")%> </span></label>
		<input type="text" placeholder="Enter expity date in MM/YY" id="exp" name="cardExp" required>
		<label>CVV<br><span class = "err"> <%=(cvvErr != null ? cvvErr : "")%> </span></label>
		<input type="text" placeholder="Enter 3 or 4 digit CVV" id="cvv" name="cvv" required>
		
                <input type="submit" name = "submit" value="Save">
                <input type="submit" name = "submit" value="Pay">
	</form>
               
</body>
</html>