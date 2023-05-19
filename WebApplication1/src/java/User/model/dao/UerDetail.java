/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package User.model.dao;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Leo
 */
public class UerDetail{
    private Statement st;

    public UerDetail(Connection conn) throws SQLException {
        st= conn.createStatement();
    }

    private UerDetail(String userName, String userPhoneNo, String userEmail, String userPassword, String userDOB) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public UerDetail findUserDetail(String email, String password) throws SQLException {
        String fetch = "SELECT * FROM INFO.USERDETAIL WHERE EMAIL= '" + email + "' AND PASSWORD='" + password + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()){
            String userEmail = rs.getString(3);
            String userPassword = rs.getString(4);
            if (userEmail.equals(email) && userPassword.equals(password)){
                String userName = rs.getString(1);
                String userPhoneNo = rs.getString(2);
                String userDOB = rs.getString(5);
                return new UerDetail(userName, userPhoneNo, userEmail, userPassword, userDOB);
            }
        }
        return null;
    }

    public void addUserDetail(String name,String phoneNo, String email, String password, String dob) throws SQLException {
        st.executeUpdate("INSERT INTO INFO.USERDETAIL VALUES('" + name + "','" + phoneNo + "','" + email + "','" + password + "','" + dob + "')");
    }

    public void updateUserDetail(String name, String phoneNo, String email, String password, String dob) throws SQLException {
        st.executeUpdate("UPDATE INFO.USERDETAIL SET NAME='" + name + "', PHONE_NO='" + phoneNo + "', PASSWORD='" + password + "', DOB='" + dob + "' WHERE EMAIL='" + email + "'");
    }

    public void deleteUserDetail(String email) throws SQLException {
        st.executeUpdate("DELETE FROM INFO.USERDETAIL WHERE EMAIL='" + email + "'");
    }

    public ArrayList<UerDetail> fetchUserDetail() throws SQLException {
        String fetch = "SELECT * FROM USERDETAIL";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<UerDetail> temp = new ArrayList<>();

        while(rs.next()) {
            String name = rs.getString(1);
            String phoneNo = rs.getString(2);
            String email = rs.getString(3);
            String password = rs.getString(4);
            String dob = rs.getString(5);
            temp.add(new UerDetail(name, phoneNo, email, password, dob));
        }
        return temp;
    }

    public boolean checkUserDetail (String email, String password) throws SQLException {
        String fetch ="SELECT * FROM INFO.USERDETAIL WHERE EMAIL ='" + email + "' AND PASSWORD='" + password + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()){
            String userEmail = rs.getString(3);
            String userPassword = rs.getString(4);
            if (userEmail.equals(email) && userPassword.equals(password)){
                return true;
            }
        }
        return false;
    }
}

/**
 *
 * @author Leo
 */
//public class UserDetail{
//    private String email;
//    private String password;
//    private String dob;
//
//    public UserDetail(String name, String phoneNo, String email, String password, String dob) {
//        this.name = name;
//        this.phoneNo = phoneNo;
//        this.email = email;
//        this.password = password;
//        this.dob = dob;
//    }
//
//}
