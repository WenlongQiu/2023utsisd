/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Order;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author xiaobing
 */
public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
            //DBManager manager = (DBManager) session.getAttribute("manager");

            int orderID = Integer.parseInt(request.getParameter("orderid"));
            int userID = Integer.parseInt(request.getParameter("userid"));
            double amount = Double.parseDouble(request.getParameter("amount"));
            String product = request.getParameter("product");
            Order order = new Order(orderID, userID, product, amount);
            session.setAttribute("order", order);
            request.getRequestDispatcher("cardInfo.jsp").include(request, response);
    }
}