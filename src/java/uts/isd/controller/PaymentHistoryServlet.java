/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Payment;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author xiaobing
 */
public class PaymentHistoryServlet extends HttpServlet{
    
 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        //ArrayList<Payment> payments = null;
        
        int customerID = (Integer)session.getAttribute("customerID");
                try{
                ArrayList<Payment> payments = manager.findPaymentsHistory(customerID);
                session.setAttribute("payments", payments);
                if(payments !=null){
                
                request.getRequestDispatcher("paymentHistory.jsp").include(request, response);
                }
        
                }catch (SQLException ex) {
                Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
            
                }   
            
              
            
    }
    
}


