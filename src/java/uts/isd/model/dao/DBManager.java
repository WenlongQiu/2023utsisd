/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import uts.isd.model.CardInfo;

/**
 *
 * @author xiaobing
 */
public class DBManager {
    
    private Statement st;

   
    public DBManager(Connection conn) throws SQLException {      
        st = conn.createStatement();   
    }
    
    public CardInfo findCardInfo(int cardID) throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.CARDINFO_T WHERE CARD_ID = " + cardID;
        ResultSet rs = st.executeQuery(fetch);
        
        while(rs.next()){
            String cardNo = rs.getString(2);
            String cardHolder = rs.getString(3);
            String cardExp = rs.getString(4);
            String cvv = rs.getString(5);
            return new CardInfo(cardNo, cardHolder, cardExp, cvv);
        }
        return null;
    }

    public void addCard(String cardNo, String cardHolder, String cardExp, String cvv) throws SQLException {
        st.executeUpdate("INSERT INTO ISDUSER.CARDINFO_T (CARD_NO, CARDHOLDER, CARD_EXP, CVV) VALUES ('"  + cardNo + "', '" + cardHolder + "','" + cardExp + "','" + cvv + "')");
    
    }
    
    public void updateCard(String cardNo, String cardHolder, String cardExp, String cvv, int cardID) throws SQLException{
        st.executeUpdate("UPDATE ISDUSER.CARDINFO_T SET CARD_NO = '" + cardNo + "', CARDHOLDER ='" + cardHolder +"', CARD_EXP ='" + cardExp + "',CVV ='" + cvv + "' WHERE CARD_ID =" + cardID);
    }


    
    public int getCardID() throws SQLException {
        int cardID = 0;

        String fetch = "SELECT MAX(CARD_ID) FROM ISDUSER.CARDINFO_T";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            cardID = rs.getInt(1);
        }
        return cardID;
    }


}
