package unit.test;
import java.util.*;
import java.sql.*;
import junit.framework.Assert;
import org.junit.Test;
import static org.junit.Assert.*;
import com.isd.*;
import uts.isd.model.dao.*;


public class DeviceTest {
    DBConnector dbconnection;
    Connection connection;
    private DeviceDBManager DeviceDBManager;

    public DeviceTest() {
        try {
            this.dbconnection = new DBConnector();
            this.connection = dbconnection.openConnection();
            this.DeviceDBManager = new DeviceDBManager(connection);
        } catch (ClassNotFoundException | SQLException ex){
            fail("Cannot connect to db 1");
        }
    }

    @Test
public void testfindDevice() throws SQLException {       
    ResultSet rs = DeviceDBManager.findDevice("123");
    if (rs.next()) {
        String result = rs.getString("deviceName");
        assertEquals("Raspberry Pi", result);
    } else {
        fail("No device found with the given ID");
    }
}

@Test
public void testfindDeviceDetails() throws SQLException {       
    ResultSet rs = DeviceDBManager.findDeviceDetails("123");
    if (rs.next()) {
        String result = rs.getString("deviceName");
        assertEquals("Raspberry Pi", result);
    } else {
        fail("No device found with the given ID");
    }
}

@Test
public void testifRole() throws SQLException {       
    ResultSet rs = DeviceDBManager.ifRole("junit@test.com");
    if (rs.next()) {
        String result = rs.getString("role");
        assertEquals("customer", result);
    } else {
        fail("No role found");
    }
}

@Test
public void testlistDevice() throws SQLException {       
    ResultSet rs = DeviceDBManager.listDevice();
    while (rs.next()) {
        String result = rs.getString("deviceName");
        if (result.contains("Raspberry Pi")){
            assertTrue(true);
            break;
        }
    }
}

//@Test
//public void testAddDevice() throws SQLException {       
//    DeviceDBManager.addDevice("123");
//    ResultSet rs = 
//    if (rs.next()) {
//        String result = rs.getString("deviceName");
//        assertEquals("Raspberry Pi", result);
//    } else {
//        fail("No device found with the given ID");
//    }
//}


 }

