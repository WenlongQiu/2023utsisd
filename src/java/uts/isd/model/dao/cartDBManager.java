package uts.isd.model.dao;
import com.isd.*;
import java.sql.*;
import java.util.*;

public class cartDBManager {
    private final Statement st;
   
    public cartDBManager(Connection conn) throws SQLException {       
        st = conn.createStatement();   
    }
   
    public List<Cart> findCart(String cartid) throws SQLException {       
        ResultSet cart = st.executeQuery("SELECT * FROM cart WHERE cartid='"+ cartid +"'");
        List<Cart> cartList = new ArrayList<>();
        while (cart.next()){
            String deviceID = cart.getString("deviceID");
            String deviceName = cart.getString("deviceName");
            String unitprice = cart.getString("unitprice");
            String cartAmount = cart.getString("amount");
            String cartPrice = cart.getString("price");
            String token = cart.getString("token");
            Cart carts = new Cart(cartid, deviceID, deviceName, unitprice, cartPrice, cartAmount, token);
            cartList.add(carts);
        }
        return cartList;
    }
    
    public List<device> findItems(String deviceValue) throws SQLException {
        ResultSet searchedItems = st.executeQuery("SELECT * FROM devices WHERE deviceid LIKE '%" + deviceValue + "%' OR deviceName LIKE '%" + deviceValue + "%'");
        List<device> queryDevice = new ArrayList<>();
        while (searchedItems.next()){
            String deviceID = searchedItems.getString("deviceID");
            String deviceName = searchedItems.getString("deviceName");
            String deviceDescription = searchedItems.getString("deviceDescription");
            String leftAmount = searchedItems.getString("amount");
            String unitPrice = searchedItems.getString("price");
            device queryDevices = new device(deviceID, deviceName, deviceDescription, leftAmount, unitPrice);
            queryDevice.add(queryDevices);
        }
        return queryDevice;
    }
    
    public void addCart (String cartID, String deviceID, String deviceName, String unitPrice, String price, String amount, String token) throws SQLException {
        st.executeUpdate("INSERT INTO cart VALUES ('" + cartID + "','" + deviceID + "','" + deviceName + "'," + amount + "," + unitPrice + "," + price + ",'" + token + "')");
    }
    
    public void delItem (String token) throws SQLException {
        st.executeUpdate("DELETE FROM cart WHERE token = '" + token + "'");
    }
    
    public void modifyCart (String cartID, String price, String token, String amount) throws SQLException {
        st.executeUpdate("UPDATE cart SET amount='" + amount + "', price='" + price + "' WHERE cartid='" + cartID + "' AND token='" + token + "'");
    }
    
}
