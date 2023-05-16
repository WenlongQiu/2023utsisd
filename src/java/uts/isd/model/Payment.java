/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author xiaobing
 */
public class Payment implements Serializable{
    
    private int paymentID;
    private String cardNo;
    private String cardHolder;
    private String expiry;
    private String CVV;
    private String status;
    private String paymentMethod;
    private double amount;
    private String paymentDate;
    
    private int orderID;
    private int customerID;
    //construcctor
    public Payment(){}

    public Payment(int paymentID, String cardNo, String cardHolder, String expiry, String CVV, String status, String paymentMethod, double amount, String paymentDate, int orderID, int customerID) {
        this.paymentID = paymentID;
        this.cardNo = cardNo;
        this.cardHolder = cardHolder;
        this.expiry = expiry;
        this.CVV = CVV;
        this.status = status;
        this.paymentMethod = paymentMethod;
        this.amount = amount;
        this.paymentDate = paymentDate;
        this.orderID = orderID;
        this.customerID = customerID;
    }

    
    
    public Payment(String cardNo, String cardHolder, String expiry, String CVV, String status, String paymentMethod, double amount, String paymentDate, int orderID, int customerID) {
        this.cardNo = cardNo;
        this.cardHolder = cardHolder;
        this.expiry = expiry;
        this.CVV = CVV;
        this.status = status;
        this.paymentMethod = paymentMethod;
        this.amount = amount;
        this.paymentDate = paymentDate;
        this.orderID = orderID;
        this.customerID = customerID;
    }
    
    public Payment(String cardNo, String cardHolder, String expiry, String CVV, String status, String paymentMethod, double amount, int orderID, int customerID) {
        this.cardNo = cardNo;
        this.cardHolder = cardHolder;
        this.expiry = expiry;
        this.CVV = CVV;
        this.status = status;
        this.paymentMethod = paymentMethod;
        this.amount = amount;
        //this.paymentDate = paymentDate;
        this.orderID = orderID;
        this.customerID = customerID;
    }
    
    public Payment(String cardNo, String cardHolder, String expiry, String CVV, String status) {
        this.cardNo = cardNo;
        this.cardHolder = cardHolder;
        this.expiry = expiry;
        this.CVV = CVV;
        this.status = status;
        
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

 


   

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }
    
    

  

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getCardHolder() {
        return cardHolder;
    }

    public void setCardHolder(String cardHolder) {
        this.cardHolder = cardHolder;
    }

    public String getExpiry() {
        return expiry;
    }

    public void setExpiry(String expiry) {
        this.expiry = expiry;
    }


    public String getCVV() {
        return CVV;
    }

    public void setCVV(String CVV) {
        this.CVV = CVV;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }





    
}
