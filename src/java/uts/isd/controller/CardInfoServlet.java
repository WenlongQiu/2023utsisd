/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;
import java.io.IOException;
import java.sql.SQLException;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.*;
import uts.isd.model.dao.*;
/**
 *
 * @author xiaobing
 */
public class CardInfoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        DBManager manager = (DBManager) session.getAttribute("manager");
        validator.clear(session);//clear the error messages
        
        String payMethod = request.getParameter("payMethod");
        String cardNo = request.getParameter("cardNo");
        String cardHolder = request.getParameter("cardHolder");
        String cardExp = request.getParameter("cardExp");
        String cvv = request.getParameter("cvv");
        String status = request.getParameter("submit");
        Order order = (Order)session.getAttribute("paymentorder");
        
      
        
        
        
        Boolean isError = false;//show all errors at one time
            if (!validator.validateCardNo(cardNo)) {
                session.setAttribute("cardErr", "Incorrect Card Number Format");
                isError = true;
                //request.getRequestDispatcher("cardInfo.jsp").include(request, response);
            } 
            if (!validator.validateName(cardHolder)) {
                session.setAttribute("nameErr", "Incorrect Card Name Format");
                isError = true;
                //request.getRequestDispatcher("cardInfo.jsp").include(request, response);
            } 
            if (!validator.validateExp(cardExp)) {
                session.setAttribute("expErr", "Incorrect Card Expiry Date Format");
                isError = true;
                //request.getRequestDispatcher("cardInfo.jsp").include(request, response);
            } 
            if (!validator.validateCVV(cvv)) {
                session.setAttribute("cvvErr", "Incorrect CVV Format");
                isError = true;
                //request.getRequestDispatcher("cardInfo.jsp").include(request, response);
            }
             
            if (!isError) {
                //registered user 
                if(session.getAttribute("userID") != null){
                try{
                int userID = (Integer)session.getAttribute("userID");
                Payment newPayment = new Payment(cardNo, cardHolder, cardExp, cvv, status, payMethod, order.getAmount(), order.getOrderID(), userID);
                manager.addPayment(newPayment);
                //manager.addPayment(cardNo, cardHolder, cardExp, cvv, status, payMethod, order.getAmount(), order.getOrderID(), order.getUserID());
                //int paymentID = manager.getPaymentID();
                //session.setAttribute("paymentID", paymentID);
                //Payment payment = manager.findPaymentByPayment(paymentID);
                //session.setAttribute("payment", payment);
                    
                request.getRequestDispatcher("main.jsp").include(request, response);
            
        
                }catch (SQLException | NullPointerException ex) {
                Logger.getLogger(CardInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                }else{
                    //anonymous user store userID = 0
                    try{
                        Payment newPayment = new Payment(cardNo, cardHolder, cardExp, cvv, status, payMethod, order.getAmount(), order.getOrderID(), 0);
                        manager.addPayment(newPayment);
                        request.getRequestDispatcher("main.jsp").include(request, response);
            
        
                }catch (SQLException | NullPointerException ex) {
                Logger.getLogger(CardInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
            }else{
                request.getRequestDispatcher("cardInfo.jsp").include(request, response);

                }      
            
    }
}