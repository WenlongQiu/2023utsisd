/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package User.controller;

/**
 *
 * @author Leo
 */


import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import User.model.dao.User;
import User.model.dao.DBManager;


public class RegisterServlet extends HttpServlet {
        break;
}

    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//        throws ServletException,IOException {
//        
//        HttpSession session = request.getSession();
//        Validator validator = new Validator();
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//        String name = request.getParameter("name");
//        String dob = request.getParameter("dob");
//        DBManager manager = (DBManager) session.getAttribute("manager");
////        validator.clear(session);
//
//        if(!validator.validateEmail(email)) {
//            session.setAttribute("emailErr", "Error: Email format is incorrect");
//            request.getRequestDispatcher("newjsp.jsp").include(request, response);
//        } else if(!validator.validateName(name)) {
//            session.setAttribute("nameErr", "Error: Name format is incorrect");
//            request.getRequestDispatcher("newjsp.jsp").include(request, response);
//        } else if (!validator.validatePassword(password)) {
//            session.setAttribute("passErr", "Error: Password format is incorrect");
//            request.getRequestDispatcher("newjsp.jsp").include(request, response);
////        } else {
////            try {
//////                User exist = manager.findUser(email, password);
//////                if (exist != null) {
////                    session.setAttribute("existErr", "User already exists in the Database!");
////                    request.getRequestDispatcher("newjsp.jsp").include(request, response);
////                } else {
//////                    manager.addUser(name, email, password, dob);
//////                    User user = new User(name, email, password, dob);
////                    session.setAttribute("user", user);
////                    request.getRequestDispatcher("main.jsp").include(request, response);
////                }
////            } catch (SQLException ex) {
////                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
////            }
//        }
//    }
//}
