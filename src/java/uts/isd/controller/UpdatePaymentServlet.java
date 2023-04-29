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
import uts.isd.model.CardInfo;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author xiaobing
 */
public class UpdatePaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        DBManager manager = (DBManager) session.getAttribute("manager");
        validator.clear(session);

        String cardNo = request.getParameter("cardNo");
        String cardHolder = request.getParameter("cardHolder");
        String cardExp = request.getParameter("cardExp");
        String cvv = request.getParameter("cvv");
        int cardID = (Integer)session.getAttribute("cardID");
        //CardInfo cardInfo = new CardInfo(cardNo, cardHolder, cvv, cvv);
        //session.setAttribute("cardInfo", cardInfo);
        
        Boolean isError = false;
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
             
                try{
                manager.updateCard(cardNo, cardHolder, cardExp, cvv, cardID);
                CardInfo cardInfo = new CardInfo(cardNo, cardHolder, cvv, cvv);
                session.setAttribute("cardInfo", cardInfo); 
                request.getRequestDispatcher("payment.jsp").include(request, response);
            
        
                }catch (SQLException | NullPointerException ex) {
                Logger.getLogger(CardInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
            
                }   
            
            }else{
                request.getRequestDispatcher("editPayment.jsp").include(request, response);

                }      
            
    }
}
