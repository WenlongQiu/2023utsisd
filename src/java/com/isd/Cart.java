package com.isd;

public class Cart {
    private String cartID;
    private String deviceID;
    private String deviceName;
    private String unitPrice;
    private String price;
    private String amount;
    private String token;

    public Cart(String cartID, String deviceID, String deviceName, String unitPrice, String price, String amount, String token) {
        this.cartID = cartID;
        this.deviceID = deviceID;
        this.deviceName = deviceName;
        this.unitPrice = unitPrice;
        this.price = price;
        this.amount = amount;
        this.token = token;
    }

    public String getCartID() {
        return cartID;
    }

    public void setCartID(String cartID) {
        this.cartID = cartID;
    }

    public String getDeviceID() {
        return deviceID;
    }

    public void setDeviceID(String deviceID) {
        this.deviceID = deviceID;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public String getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
