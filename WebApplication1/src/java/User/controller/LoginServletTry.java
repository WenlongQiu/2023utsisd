/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Leo
 */
import User.model.dao.User;
import java.io.IOException;
import static java.lang.Boolean.TRUE;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServletTry extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {
        try {
            System.out.print("this.....................................");
            String username = request.getParameter("un");
            String password = request.getParameter("pw");
            if (isValidUser(username, password)) {
                response.sendRedirect("login.jsp");
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (Throwable theException) {
            System.out.println(theException);
        }
    }

    public boolean isValidUser(String username, String password) {
        return TRUE;
    }
}
//        try {
//            User user = new User();
//            user.setUserName(request.getParameter("un"));
//            user.setPassword(request.getParameter("pw"));
//
//            user = UserDAO.login(user);
//            if (user.isValid()) {
//        HttpSession session = request.getSession(true);
//            session.setAttribute("currentSessionUser", user);
//        response.sendRedirect("mainone.jsp"); //logged-in page      		
//            } else {
////                response.sendRedirect("invalidLogin.jsp"); //error page 
//    }
//}
//    catch (Throwable theException

//        ) {
//            System.out.println(theException);
//    }
//}
//}
