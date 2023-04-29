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
public class CardInfo implements Serializable{

    private String cardNo;
    private String cardHolder;
    private String expiry;
    private String CVV;
    

    public CardInfo(){}

    public CardInfo(String cardNo, String cardHolder, String expiry, String CVV) {
        this.cardNo = cardNo;
        this.cardHolder = cardHolder;
        this.expiry = expiry;
        this.CVV = CVV;
        
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
    
}