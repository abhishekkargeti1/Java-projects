/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.project1.servlets;

import com.project1.dao.UserDao;
import com.project1.entities.Message;
import com.project1.entities.User;
import com.project1.entities.Validation;
import com.project1.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author abhis
 */
@MultipartConfig
public class Login_Servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            // login
            // fetching Username and Password from the Login_page

            String Email = request.getParameter("User_email");
            String Password = request.getParameter("User_password");
            Validation valid = new Validation();
            if (valid.User_EmailChecker1(Email)) {
                if (valid.User_PasswordChecker(Password)) {

                    UserDao dao = new UserDao(ConnectionProvider.getConnection());
                    User user = dao.getUserbyEmailAndPassword(Email, Password);
                    if (user == null) {
                        //login fail
                        Message message = new Message("Invalid Email and Password", "Error", "alert-danger");
                        HttpSession session = request.getSession();
                        session.setAttribute("message", message);
                        response.sendRedirect("Login_page.jsp");
                    } else {
                        // login Successfully
                        HttpSession session = request.getSession();
                        session.setAttribute("CurrentUser", user);
                        response.sendRedirect("Profile_page.jsp");

                    }
                } else {
                     Message message = new Message("Password Not Null", "Error", "alert-danger");
                      HttpSession session = request.getSession();
                       session.setAttribute("message", message);
                       response.sendRedirect("Login_page.jsp");
                }
            } else {
                      Message message = new Message("Email Not Null", "Error", "alert-danger");
                      HttpSession session = request.getSession();
                       session.setAttribute("message", message);
                       response.sendRedirect("Login_page.jsp");
            }

            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
