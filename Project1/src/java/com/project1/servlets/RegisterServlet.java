/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.project1.servlets;

import com.project1.dao.UserDao;
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

/**
 *
 * @author abhis
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {

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

            String CheckBox = request.getParameter("check1");
            if (CheckBox == null) {
                System.out.println(CheckBox);
                out.println("Please Accept the Terms and Condition");
            } else {
                String Name = request.getParameter("Fname");
                System.out.println(Name);
                String Email = request.getParameter("Email");
                String Password = request.getParameter("password");
                String PhoneNumber = request.getParameter("PhoneNumber");
                String Gender = request.getParameter("Gender");
                String Profile = request.getParameter("Profile");
                Validation valid = new Validation(ConnectionProvider.getConnection());
             if(valid.User_NameChecker(Name)){ 
                 System.out.println("Enter in NameChecker if");
                if (valid.User_phonenumberChecker(PhoneNumber)) {
                    if (valid.User_Emailchecker(Email)) {
                        User user = new User(Name, Email, Password, PhoneNumber, Gender, Profile);
                        UserDao dao = new UserDao(ConnectionProvider.getConnection());
                        if (dao.saveUser(user)) {
                            System.out.println("Enter in dao.saveUser if");
                            out.println("Done");
                        } else {
                            System.out.println("Enter in dao.saveUser else");
                            out.println("Error");
                        }
                    } else {
                        out.println("Email Exist Please Login ");
                    }
                } else {
                    out.println("Phone Number is Invalid ");
                }
             }else{
                 out.println("Name should not be null");
             }  
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
