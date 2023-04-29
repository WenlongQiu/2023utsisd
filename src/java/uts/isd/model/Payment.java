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
    private int orderID;
    private String payMethod;
    private String cardNo;
    private String cardHolder;
    private String expiry;
    private String CVV;
    private double amount;
    private Date payDate;
    private String submission;
    
    //construcctor
    public Payment(){}

    public Payment(int orderID, String payMethod, String cardNo, String cardHolder, String expiry, String CVV, double amount, Date payDate, String submission) {
        this.orderID = orderID;
        this.payMethod = payMethod;
        this.cardNo = cardNo;
        this.cardHolder = cardHolder;
        this.expiry = expiry;
        this.CVV = CVV;
        this.amount = amount;
        this.payDate = payDate;
        this.submission = submission;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }
    
    

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
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

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public String getSubmission() {
        return submission;
    }

    public void setSubmission(String submission) {
        this.submission = submission;
    }




    
}
