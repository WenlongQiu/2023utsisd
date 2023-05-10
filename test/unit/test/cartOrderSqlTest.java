package unit.test;

import com.isd.*;
import org.junit.Test;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;
import static org.junit.Assert.*;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import uts.isd.model.dao.*;

@FixMethodOrder(MethodSorters.NAME_ASCENDING) 
// Define the testing tasks order, prevent from execute delete before update
public class cartOrderSqlTest {
    DBConnector dbconn;
    Connection conn;
    private Random random = new Random();
    private OrderDBManager OrderDBManager;
    private cartDBManager cartDBManager;
    private String TestingOrderID = "12346789";
    private String TestingCartID = "12346789";
    private String idForFindOrder = "78451674"; // Exist order for test FindOrders()
    private String idForFindCart = "987654321"; // Exist cart for test FindCarts()

    public cartOrderSqlTest() {
        try {
            this.dbconn = new DBConnector();
            this.conn = dbconn.openConnection();
            this.OrderDBManager = new OrderDBManager(conn);
            this.cartDBManager = new cartDBManager(conn);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(cartOrderSqlTest.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // OrderDBManager.java
    @Test
    public void a_evaluatesFindSpecificOrder() throws SQLException {
        List<order> orderList = OrderDBManager.findOrder(idForFindOrder, "01/05/2023", "placed");
        if (!orderList.isEmpty()) {
            order order = orderList.get(0);
            String output = order.getOrderID();
            assertEquals(idForFindOrder, output);
        }  else {
            fail("Test Error. #o1");
        }
    }

    @Test
    public void b_evaluatesFindAllOrder() throws SQLException {
    List<order> orderList = OrderDBManager.findAllOrder("junitplacedtest@gmail.com", "placed");
    if (!orderList.isEmpty()) {
        order order = orderList.get(0);
        String output = order.getOrderID();
        assertEquals(idForFindOrder, output);
    }  else {
            fail("Test Error. #o2");
        }
    }

    @Test
    public void c_evaluatesReadOrderDetails() throws SQLException {
        List<order> orderList = OrderDBManager.readOrderDetails(idForFindOrder);
        if (!orderList.isEmpty()) {
            order order = orderList.get(0);
            String output = order.getOrderID();
            assertEquals(idForFindOrder, output);
        }  else {
            fail("Test Error. #o3");
        }
    }
    
    @Test
    public void d_evaluatesPlaceOrder() throws SQLException {
        OrderDBManager.placeOrder(TestingOrderID, "junittest@gmail.com", "01/01/2000", "12345678", "1", "junit", "123 Junit Street", "0412345678", "saved");
        List<order> orderList = OrderDBManager.readOrderDetails(TestingOrderID);
        if (!orderList.isEmpty()) {
            order order = orderList.get(0);
            String output = order.getOrderID();
            assertEquals(TestingOrderID, output);
            
        }  else {
            fail("Test Error. #o4");
        }
    }
    
    @Test
    public void e_evaluatesUpdateOrder() throws SQLException {
        OrderDBManager.updateOrder(TestingOrderID, "12345678", "junitupdate", "2", "123 JunitTest Street", "0498765432");
        List<order> orderList = OrderDBManager.readOrderDetails(TestingOrderID);
        if (!orderList.isEmpty()) {
           order order = orderList.get(0);
           String output = order.getName();
           assertEquals("junitupdate", output);
        } else {
           fail("Test Error. #o5");
        }
    }
    
    @Test
    public void f_evaluatesConfirmOrder() throws SQLException {
        OrderDBManager.confirmOrder(TestingOrderID);
        List<order> orderList = OrderDBManager.readOrderDetails(TestingOrderID);
        if (!orderList.isEmpty()) {
           order order = orderList.get(0);
           String output = order.getStatus();
           assertEquals("placed", output);
        } else {
           fail("Test Error. #o6");
        }
    }
    
    @Test
    public void g_evaluatesDeleteOrder() throws SQLException {
       OrderDBManager.deleteOrder(TestingOrderID);
       List<order> orderList = OrderDBManager.readOrderDetails(TestingOrderID);
       if (orderList.isEmpty()) {
          assertTrue(true);
        } else {
          fail("Test Error. #o7");
        }
    }

    
    //CartDBManager.java
    @Test
    public void h_evaluatesfindCart() throws SQLException {
        List<Cart> resultSet = cartDBManager.findCart(idForFindCart);
        if (!resultSet.isEmpty()) {
            Cart cart = resultSet.get(0);
            String output = cart.getCartID();
            assertEquals(idForFindCart, output);
        } else {
            fail("Test Error. #c1");
        }
    }
    
    @Test
    public void i_evaluatesfindItems() throws SQLException {
        List<device> deviceList = cartDBManager.findItems("123");
        if (!deviceList.isEmpty()) {
            device device = deviceList.get(0);
            String output = device.getDeviceID();
            assertEquals("123", output);
        } else {
            fail("Test Error. #c2");
        }
    }
    
    @Test
    public void j_evaluatesAddCart() throws SQLException {
        cartDBManager.addCart(TestingCartID, "123", "Raspberry Pi", "100", "100", "1", "123");
        List<Cart> cartList = cartDBManager.findCart(TestingCartID);
        if (!cartList.isEmpty()) {
            Cart cart = cartList.get(0);
            String output = cart.getDeviceID();
            assertEquals("123", output);
            
        }  else {
            fail("Test Error. #c3");
        }
    }
    
    @Test
    public void k_evaluatesModifyCart() throws SQLException {
        cartDBManager.addCart(TestingCartID, "123", "Raspberry Pi", "100", "100", "1", "123");
        List<Cart> cartList = cartDBManager.findCart(TestingCartID);
        if (!cartList.isEmpty()) {
            Cart cart = cartList.get(0);
            String output = cart.getDeviceID();
            assertEquals("123", output);
            
        }  else {
            fail("Test Error. #c4");
        }
    }
    
    @Test
    public void l_evaluatesDelItem() throws SQLException {
       cartDBManager.delItem("123");
       List<Cart> cartList = cartDBManager.findCart(TestingCartID);
       if (cartList.isEmpty()) {
          assertTrue(true);
       } 
       else {
           for (Cart cart : cartList) {
                String output = cart.getDeviceID();
                if (output.contains("123")){
                    fail("Test Error. #c5");
                    break; // If find the token "123", then stop loop and fail the test
                }
           } // If the cart still be existed. Check the items per line to find item with token "123"
           assertTrue(true); // If the item is not found, then pass the test
       }
    }
}
