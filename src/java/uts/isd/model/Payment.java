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
    
    
    private String cardNo;
    private String cardHolder;
    private String expiry;
    private String CVV;
    private String status;
    private String paidMethod;
    private double amount;
    private String paidDate;
    
    private int orderID;
    private int customerID;
    //construcctor
    public Payment(){}

    public Payment(String cardNo, String cardHolder, String expiry, String CVV, String status, String paidMethod, double amount, String paidDate, int orderID, int customerID) {
        this.cardNo = cardNo;
        this.cardHolder = cardHolder;
        this.expiry = expiry;
        this.CVV = CVV;
        this.status = status;
        this.paidMethod = paidMethod;
        this.amount = amount;
        this.paidDate = paidDate;
        this.orderID = orderID;
        this.customerID = customerID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaidMethod() {
        return paidMethod;
    }

    public void setPaidMethod(String paidMethod) {
        this.paidMethod = paidMethod;
    }

    public String getPaidDate() {
        return paidDate;
    }

    public void setPaidDate(String paidDate) {
        this.paidDate = paidDate;
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
