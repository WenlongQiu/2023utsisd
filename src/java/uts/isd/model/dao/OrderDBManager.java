package uts.isd.model.dao;
import com.isd.*;
import java.sql.*;
import java.util.*;

public class OrderDBManager {

private final Statement st;
   
public OrderDBManager(Connection conn) throws SQLException {       
   st = conn.createStatement();   
}
   
public List<order> findOrder(String orderid, String orderdate, String status) throws SQLException {       
    ResultSet rs = st.executeQuery("SELECT * FROM orders WHERE orderID='"+ orderid +"' AND orderdate='" + orderdate + "' AND status='"+ status +"'");
    List<order> orders = new ArrayList<>();
    while (rs.next()){
        String userid = rs.getString("userID");
        String cartid = rs.getString("cartid");
        String amount = rs.getString("amount");
        String name = rs.getString("name");
        String address = rs.getString("address");
        String phonenum = rs.getString("phonenum");
        order order = new order(orderid,userid,orderdate,cartid,amount,name,address,phonenum,status);
        orders.add(order);
    }
    return orders;
}

public List<order> findAllOrder(String userid, String status) throws SQLException {       
   //setup the select sql query string       
   //execute this query using the statement field       
   //add the results to a ResultSet       
   //search the ResultSet for a user using the parameters
   List<order> orders = new ArrayList<>();
   ResultSet rs = st.executeQuery("SELECT * FROM orders WHERE userID = '"+userid+"' AND status='"+status+"'");
   while (rs.next()){
    String orderID = rs.getString("orderid");
    String orderDate = rs.getString("orderDate");
    String cartid = rs.getString("cartid");
    String amount = rs.getString("amount");
    String name = rs.getString("name");
    String address = rs.getString("address");
    String phonenum = rs.getString("phonenum");
    String orderStatus = rs.getString("status");
    order order = new order(orderID,userid,orderDate,cartid,amount,name,address,phonenum,orderStatus);
    orders.add(order);
   }
    return orders;
}

public void placeOrder(String orderid, String userid, String orderdate, String cartid, String amount, String name, String address, String phonenum, String status) throws SQLException {  
  st.executeUpdate("INSERT INTO orders VALUES('" + orderid + "','" + userid + "','" + orderdate + "','" + cartid + "','" + amount + "','" + name + "','" + address + "','" + phonenum + "','" + status + "')");   
}

public List<order> readOrderDetails(String orderid) throws SQLException {
    ResultSet rs = st.executeQuery("SELECT * FROM orders WHERE orderID='"+orderid+"'");
    List<order> orders = new ArrayList<>();
   while (rs.next()){
    String userid = rs.getString("userid");
    String orderDate = rs.getString("orderDate");
    String cartid = rs.getString("cartid");
    String amount = rs.getString("amount");
    String name = rs.getString("name");
    String address = rs.getString("address");
    String phonenum = rs.getString("phonenum");
    String orderStatus = rs.getString("status");
    order order = new order(orderid,userid,orderDate,cartid,amount,name,address,phonenum,orderStatus);
    orders.add(order);
   }
    return orders;
}

public void updateOrder(String orderid, String cartid, String name, String amount, String address, String phonenum) throws SQLException {       
   //code for update-operation   
   st.executeUpdate("UPDATE `orders` SET `amount` = '"+amount+"', `name` = '"+name+"', `address` = '"+address+"', `phonenum` = '"+phonenum+"' WHERE `orderID` = '"+orderid+"'");   
}       

public void confirmOrder(String orderid) throws SQLException {
   st.executeUpdate("UPDATE orders SET status='placed' WHERE orderID='" + orderid + "'");   
}

public void deleteOrder(String orderid) throws SQLException{       
   //code for delete-operation   
   st.executeUpdate("DELETE FROM orders WHERE orderID = '" + orderid + "'");
}
}