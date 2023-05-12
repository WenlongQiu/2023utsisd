package uts.isd.model.dao;

import com.isd.*;
import java.sql.*;
import java.util.*;

/* 
* DBManager is the primary DAO class to Stringeract with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
*/

public class DeviceDBManager {

private Statement st;
   
public DeviceDBManager(Connection conn) throws SQLException {       
   st = conn.createStatement(); 
}

//Find user by email and password in the database   
public ResultSet findDevice(String deviceID) throws SQLException {       
   //setup the select sql query string       
   //execute this query using the statement field       
   //add the results to a ResultSet       
   //search the ResultSet for a user using the parameters   
   ResultSet rs = st.executeQuery("SELECT * FROM devices WHERE deviceID='"+deviceID+"' OR deviceName='"+deviceID+"'"); //String devicename = rs.getStream();
   return rs;   
}

public ResultSet findDeviceDetails(String deviceID) throws SQLException {       
   //setup the select sql query string       
   //execute this query using the statement field       
   //add the results to a ResultSet       
   //search the ResultSet for a user using the parameters   
   ResultSet rs = st.executeQuery("SELECT * FROM devices WHERE deviceID='"+deviceID+"'");
   return rs;   
}

public ResultSet ifRole(String userID) throws SQLException {
    ResultSet rs = st.executeQuery("SELECT * FROM users WHERE userID= '" +userID+"'");
          return rs;
}

//Add a user-data Stringo the database   
public ResultSet listDevice() throws SQLException {                   //code for add-operation       
  ResultSet rs = st.executeQuery("SELECT * FROM devices");   
    return rs;
}

//update a user details in the database   
public void addDevice(String deviceid, String deviceName, String deviceDescription,String amount,String price ) throws SQLException {       
   //code for update-operation   
  st.executeUpdate("INSERT INTO devices VALUES ('"+deviceid+"','"+deviceName+"','"+deviceDescription+"','"+amount+"','"+price+"')");
}       

public void deleteDevice(String deviceid) throws SQLException {       
    st.executeUpdate("DELETE FROM devices WHERE deviceID = '" + deviceid + "'");
}

public void updateDevice(String deviceID, String deviceName, String deviceDescription,String amount,String price) throws SQLException{
    st.executeUpdate("UPDATE devices SET devicename = '"+deviceName+"', devicedescription ='" + deviceDescription +"',  Amount = '"+amount+"', Price = '"+price+"' where deviceid = '"+deviceID+"'" );

}}