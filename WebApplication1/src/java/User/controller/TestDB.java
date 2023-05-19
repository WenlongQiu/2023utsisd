/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package User.controller;

/**
 *
 * @author Leo
 */
import User.model.dao.DBManager;
import User.model.dao.UerDetail;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;
import User.model.dao.User;
import User.model.dao.*;
import java.sql.*;

import java.util.*;

import java.util.logging.*;

public class TestDB {
//
//    private static Scanner in = new Scanner(System.in);
//    private DBConnector connector;
//    private Connection conn;
//    private DBManager db;
//
//    public static void main(String[] args) throws SQLException {
////        (new TestDB()).runQueries();
//        TestDB a = new TestDB();
//    }
//
//    public TestDB() {
//
//        try {
//
//            connector = new DBConnector();
//
//            conn = connector.openConnection();
//
//            db = new DBManager(conn);
//
//        } catch (ClassNotFoundException | SQLException ex) {
//
//            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
//
//        }
//
//    }

    private static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {

        try {

            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManager db = new DBManager(conn);

//            System.out.print("User email: ");
//
//            String email = in.nextLine();
//
//            System.out.print("User name: ");
//
//            String name = in.nextLine();
//
//            System.out.print("User password: ");
//
//            String password = in.nextLine();
//
//            System.out.print("User gender: ");
//
//            String gender = in.nextLine();
//
//            System.out.print("User favorite color: ");
//
//            String favcol = in.nextLine();
//
//            db.addUser(email, name, password, gender, favcol);
//
//            System.out.println("User is added to the database.");

            connector.closeConnection();

        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

}

