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
public class EditPaymentServlet extends HttpServlet{
    
 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");

        int cardID = (Integer)session.getAttribute("cardID");
        
        CardInfo cardInfo = null;
             
                try{
                cardInfo = manager.findCardInfo(cardID);
                if(cardInfo !=null){
                session.setAttribute("cardInfo", cardInfo);
                request.getRequestDispatcher("editPayment.jsp").include(request, response);
                }
        
                }catch (SQLException | NullPointerException ex) {
                Logger.getLogger(CardInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
            
                }   
            
              
            
    }
}