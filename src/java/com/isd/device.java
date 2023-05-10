package com.isd;

public class device {
    private String deviceID;
    private String deviceName;
    private String deviceDescription;
    private String amount;
    private String price;
    
    public device(String deviceID, String deviceName, String deviceDescription, String amount, String price) {
        this.deviceID = deviceID;
        this.deviceName = deviceName;
        this.deviceDescription = deviceDescription;
        this.amount = amount;
        this.price = price;
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
    
    public String getDeviceDescription() {
        return deviceDescription;
    }
    
    public void setDeviceDescription(String deviceDescription) {
        this.deviceDescription = deviceDescription;
    }
    
    public String getAmount() {
        return amount;
    }
    
    public void setAmount(String amount) {
        this.amount = amount;
    }
    
    public String getPrice() {
        return price;
    }
    
    public void setPrice(String price) {
        this.price = price;
    }
}
