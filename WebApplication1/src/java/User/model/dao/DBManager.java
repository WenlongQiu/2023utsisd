/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package User.model.dao;

/**
 *
 * @author Leo
 */
import java.sql.*;

/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
 */
public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

//Find user by email and password in the database   
    public User findUser(String email, String password) throws SQLException {
        //setup the select sql query string       
        //execute this query using the statement field       
        //add the results to a ResultSet       
        //search the ResultSet for a user using the parameters         
//   return null;   
        String fetch = "SELECT * FROM INFO.USERDETAIL WHERE EMAIL= '" + email + "' AND PASSWORD='" + password + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String userEmail = rs.getString(3);
            String userPassword = rs.getString(4);
            if (userEmail.equals(email) && userPassword.equals(password)) {
                String userName = rs.getString(1);
                String userPhoneNo = rs.getString(2);
                String userDOB = rs.getString(5);
                return new User(userName, userPhoneNo, userEmail, userPassword, userDOB);
            }
        }
        return null;
    }

//Add a user-data into the database   
    public void addUser(String email, String name, String password, String phoneNo, String dob) throws SQLException {
        //code for add-operation

        st.executeUpdate("INSERT INTO INFO.USERDETAIL VALUES('" + name + "','" + phoneNo + "','" + email + "','" + password + "','" + dob + "')");

    }

//update a user details in the database   
    public void updateUser(String email, String name, String password, String phoneNo, String dob) throws SQLException {
        //code for update-operation   
        st.executeUpdate("UPDATE INFO.USERDETAIL SET NAME='" + name + "', PHONE_NO='" + phoneNo + "', PASSWORD='" + password + "', DOB='" + dob + "' WHERE EMAIL='" + email + "'");

    }

//delete a user from the database   
    public void deleteUser(String email) throws SQLException {
        //code for delete-operation   
        st.executeUpdate("DELETE FROM INFO.USERDETAIL WHERE EMAIL='" + email + "'");
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
