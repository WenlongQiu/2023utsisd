/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package User.model.dao;

import java.sql.Connection;

/**
 *
 * @author Leo
 */
public abstract class DB {
    protected String URL = "jdbc:derby://localhost:1527/";
    protected String db = "user infor";
    protected String dbuser = "info";
    protected String dbpass ="uts";
    protected String driver ="org.apache.derby.jdbc.ClientDriver";
    protected Connection conn;
}
