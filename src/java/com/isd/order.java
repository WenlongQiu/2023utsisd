package com.isd;

public class order {
    private String orderid;
    private String userid;
    private String orderdate;
    private String cartID;
    private String amount;
    private String name;
    private String address;
    private String phonenum;
    private String status;
    
    public order(String orderid, String userid, String orderdate, String cartID, String amount, String name, String address, String phonenum, String status) {
        this.orderid = orderid;
        this.userid = userid;
        this.orderdate = orderdate;
        this.cartID = cartID;
        this.amount = amount;
        this.name = name;
        this.address = address;
        this.phonenum = phonenum;
        this.status = status;
    }
    
    public void showOrders(String orderid, String userid, String orderdate, String cartID, String amount) {
        this.orderid = orderid;
        this.userid = userid;
        this.orderdate = orderdate;
        this.cartID = cartID;
        this.amount = amount;
    }
    
    public void findOrder(String orderid, String userid, String orderdate, String cartID, String amount) {
        this.orderid = orderid;
        this.userid = userid;
        this.orderdate = orderdate;
        this.cartID = cartID;
        this.amount = amount;
    }
    
    public void placeOrder(String orderid, String userid, String orderdate, String cartID, String amount, String name, String address, String phonenum, String status) {
        this.orderid = orderid;
        this.userid = userid;
        this.orderdate = orderdate;
        this.cartID = cartID;
        this.amount = amount;
        this.name = name;
        this.address = address;
        this.phonenum = phonenum;
        this.status = status;
    }
    
    public String getOrderID() {
        return orderid;
    }

    public void setOrderID(String orderid) {
        this.orderid = orderid;
    }

    public String getUserID() {
        return userid;
    }

    public void setUserID(String userid) {
        this.userid = userid;
    }

    public String getOrderDate() {
        return orderdate;
    }

    public void setOrderDate(String orderdate) {
        this.orderdate = orderdate;
    }

    public String getCartID() {
        return cartID;
    }

    public void setCartID(String cartID) {
        this.cartID = cartID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

     public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }


}