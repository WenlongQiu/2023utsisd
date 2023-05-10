package com.isd;
import java.io.Serializable;

public class user implements Serializable{
    private String userid;
    private String fullName;
    private String password;
    private String address;
    private String tos;
    
    public user() {}
    
    public user(String userid, String name, String pwd, String add, String tos) {
        this.userid = userid;
        this.fullName = name;
        this.password = pwd;
        this.address = add;
        this.tos = tos;
    }
    
    public String getUserID() {
        return userid;
    }

    public void setUserID(String userid) {
        this.userid = userid;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getifAgreeTOS() {
        return tos;
    }

    public void setifAgreeTOS(String tos) {
        this.tos = tos;
    }

}