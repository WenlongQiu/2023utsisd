/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model.dao;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import uts.isd.model.Payment;

/**
 *
 * @author xiaobing
 */
public class DBManager {
    
    private Statement st;

   
    public DBManager(Connection conn) throws SQLException {      
        st = conn.createStatement();   
    }
    
    public ArrayList<Payment> findSavedPayments(int customerID) throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.PAYMENT_T WHERE CUSTOMER_ID = " + customerID + " AND STATUS = 'Save'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Payment> temp = new ArrayList();
        while(rs.next()){
            int paymentID = rs.getInt(1);
            String cardNo = rs.getString(2);
            String cardHolder = rs.getString(3);
            String cardExp = rs.getString(4);
            String cvv = rs.getString(5);
            String status = rs.getString(6);
            String paymentMethod = rs.getString(7);
            double amount = rs.getDouble(8);
            String paidDate = rs.getString(9);
            int orderID = rs.getInt(10);
            
            
            temp.add(new Payment(paymentID, cardNo, cardHolder, cardExp, cvv, status, paymentMethod,  amount, paidDate, orderID, customerID));
        }
        return temp;
    }
    
        public ArrayList<Payment> findPaymentsHistory(int customerID) throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.PAYMENT_T WHERE CUSTOMER_ID = " + customerID + " AND STATUS = 'Pay'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Payment> temp = new ArrayList();
        while(rs.next()){
            int paymentID = rs.getInt(1);
            String cardNo = rs.getString(2);
            String cardHolder = rs.getString(3);
            String cardExp = rs.getString(4);
            String cvv = rs.getString(5);
            String status = rs.getString(6);
            String paymentMethod = rs.getString(7);
            double amount = rs.getDouble(8);
            String paidDate = rs.getString(9);
            int orderID = rs.getInt(10);
            
            
            temp.add(new Payment(paymentID, cardNo, cardHolder, cardExp, cvv, status, paymentMethod,  amount, paidDate, orderID, customerID));
        }
        return temp;
    }
    
    public Payment findPaymentByPayment(int paymentID) throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.PAYMENT_T WHERE PAYMENT_ID = " + paymentID;
        ResultSet rs = st.executeQuery(fetch);
        
        while(rs.next()){
            String cardNo = rs.getString(2);
            String cardHolder = rs.getString(3);
            String cardExp = rs.getString(4);
            String cvv = rs.getString(5);
            String status = rs.getString(6);
            String paymentMethod = rs.getString(7);
            double amount = rs.getDouble(8);
            String paidDate = rs.getString(9);
            int orderID = rs.getInt(10);
            int customerID = rs.getInt(11);
            
            
            return new Payment(paymentID, cardNo, cardHolder, cardExp, cvv, status, paymentMethod,  amount, paidDate, orderID, customerID);
        }
        return null;
    }
    
    
    
public ArrayList<Payment> searchPayments(String paymentID, String paymentDate, int customerID) throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.PAYMENT_T WHERE STATUS = 'Pay' AND CUSTOMER_ID = " + customerID;
        if (!paymentID.equals("")){
            fetch = fetch + " AND  PAYMENT_ID = " + paymentID;
        }
        if (!paymentDate.equals("")){
            fetch = fetch + " AND  PAID_DATE = " + "'" +paymentDate +"'";
        }
        
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Payment> temp = new ArrayList();
        while(rs.next()){
            
            String cardNo = rs.getString(2);
            String cardHolder = rs.getString(3);
            String cardExp = rs.getString(4);
            String cvv = rs.getString(5);
            String status = rs.getString(6);
            String paymentMethod = rs.getString(7);
            double amount = rs.getDouble(8);
            String paidDate = rs.getString(9);
            int orderID = rs.getInt(10);
            
            
            
            temp.add(new Payment(rs.getInt(1), cardNo, cardHolder, cardExp, cvv, status, paymentMethod,  amount, paidDate, orderID, customerID));
        }
        return temp;
    }
    
    /*
    public void addPayment(String cardNo, String cardHolder, String cardExp, String cvv, String status, String paidMethod,double amount, int orderID, int customerID) throws SQLException {
        st.executeUpdate("INSERT INTO ISDUSER.PAYMENT_T (CARD_NO, CARDHOLDER, CARD_EXP, CVV, STATUS, PAYMENT_METHOD, AMOUNT, PAID_DATE, ORDER_ID, CUSTOMER_ID) VALUES ('" 
                + cardNo + "', '" + cardHolder + "','" + cardExp + "','" + cvv +  "','" +  status + "','" + paidMethod + "'," + amount + ", CURRENT_DATE ," + orderID + "," + customerID +")");
    
    }
*/  public void addPayment(Payment payment) throws SQLException{
        st.executeUpdate("INSERT INTO ISDUSER.PAYMENT_T (CARD_NO, CARDHOLDER, CARD_EXP, CVV, STATUS, PAYMENT_METHOD, AMOUNT, PAID_DATE, ORDER_ID, CUSTOMER_ID) VALUES ('" 
                + payment.getCardNo() + "', '" + payment.getCardHolder() + "','" + payment.getExpiry() + "','" + payment.getCVV() +  "','" +  payment.getStatus() + "','" + payment.getPaymentMethod() + "'," + payment.getAmount() + ", CURRENT_DATE ," + payment.getOrderID() + "," + payment.getCustomerID() +")");
    
    }


    /*
    public void updatePayment(String cardNo, String cardHolder, String cardExp, String cvv, int paymentID, String status) throws SQLException{
        st.executeUpdate("UPDATE ISDUSER.PAYMENT_T SET CARD_NO = '" + cardNo + "', CARDHOLDER ='" + cardHolder +"', CARD_EXP ='" + cardExp + "',CVV ='" + cvv + "', STATUS ='" + status + "', PAID_DATE = CURRENT_DATE WHERE PAYMENT_ID =" + paymentID);
    }
    */
    public void updatePayment(Payment payment, int paymentID) throws SQLException{
       st.executeUpdate("UPDATE ISDUSER.PAYMENT_T SET CARD_NO = '" + payment.getCardNo() + "', CARDHOLDER ='" + payment.getCardHolder() +"', CARD_EXP ='" + payment.getExpiry() + "',CVV ='" + payment.getCVV() + "', STATUS ='" + payment.getStatus() + "', PAID_DATE = CURRENT_DATE WHERE PAYMENT_ID =" + paymentID);
    
    }
    
    

    public void deletePayment(int paymentID) throws SQLException{
        st.executeUpdate("DELETE FROM ISDUSER.PAYMENT_T WHERE PAYMENT_ID = " + paymentID);
    }
    
    //if do not want to delete the record set status to cancel
    public void cancelPayment(int paymentID) throws SQLException{
        st.executeUpdate("UPDATE ISDUSER.PAYMENT_T SET STATUS = 'Cancel', PAID_DATE = CURRENT_DATE WHERE PAYMENT_ID =" + paymentID);
    }
    //get current insert payment's id
    public int getPaymentID() throws SQLException {
        int paymentID = 0;

        String fetch = "SELECT MAX(PAYMENT_ID) FROM ISDUSER.PAYMENT_T";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            paymentID = rs.getInt(1);
        }
        return paymentID;
    }


}
