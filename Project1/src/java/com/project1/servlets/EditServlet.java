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
import com.project1.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class EditServlet extends HttpServlet {

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
        System.out.println("Entering processRequest in EditServlet");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            // Get the user from the session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("CurrentUser");
            
            // Getting Data from FrontEnd 
            String Name = request.getParameter("User_Name");
            String PhoneNumber = request.getParameter("User_PhoneNumber");
            String oldProfilePic = user.getUser_Profile();
            Part part = request.getPart("User_ProfilePic");
            
            
            String ImageName = (part == null || part.getSubmittedFileName().isEmpty()) ? oldProfilePic : part.getSubmittedFileName();

//            System.out.println("ImageName:" + ImageName);

           
            Validation valid = new Validation();

            
            if (valid.User_NameChecker(Name)) {
                if (valid.User_phonenumberChecker(PhoneNumber)) {
                    user.setName(Name);
                    user.setPhoneNumber(PhoneNumber);
                    user.setUser_Profile(ImageName);

//                    System.out.println("Old Profile Pic Name " + oldProfilePic);

                    UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                    boolean status = userDao.UpdateUserDetails(user);
                    if (status) {
                        String path = request.getServletContext().getRealPath("/") + "images" + File.separator + user.getUser_Profile();

                        // Delete old file
                        String pathOldFile = request.getServletContext().getRealPath("/") + "images" + File.separator + oldProfilePic;
                        if (ImageName != null && !ImageName.isEmpty() && !isDefaultPhoto(pathOldFile,path)) {
//                            System.out.println("I am delete method");
//                            System.out.println(pathOldFile);
                            Helper.deleteFile(pathOldFile);
                            
                        }

                        if (ImageName != null && !"".equals(ImageName) &&  !part.getSubmittedFileName().isEmpty() ) {
                            if (Helper.saveFile(part.getInputStream(), path)) {
                                Message message = new Message("Profile Updated Successfully", "success", "alert-success");
                                session.setAttribute("message", message);
                                response.sendRedirect("Profile_page.jsp");
                            } else {
                                Message message = new Message("Profile Not Updated", "Error", "alert-danger");
                                session.setAttribute("message", message);
                                response.sendRedirect("Profile_page.jsp");
                            }
                        } else {
                            Message message = new Message("Profile Updated Successfully", "success", "alert-success");
                            session.setAttribute("message", message);
                            response.sendRedirect("Profile_page.jsp");
                        }
                    } else {
                        Message message = new Message("Not Updated Successfully", "Error", "alert-danger");
                        session.setAttribute("message", message);
                        response.sendRedirect("Profile_page.jsp");
                    }
                } else {
                    Message message = new Message("Number is not valid", "Error", "alert-danger");
                    session.setAttribute("message", message);
                    response.sendRedirect("Profile_page.jsp");
                }
            } else {
                Message message = new Message("Name should not be null", "Error", "alert-danger");
                session.setAttribute("message", message);
                response.sendRedirect("Profile_page.jsp");
            }

            out.println("</body>");
            out.println("</html>");
        } catch (Exception e) {
            System.out.println("Error occurred in processRequest");
            e.printStackTrace();
        }
    }

    // Function to check if the old photo is the default photo
    private boolean isDefaultPhoto(String pathOldFile,String path) {
        // Implement your logic to check if the pathOldFile is the default photo
        // For example, you might check if the pathOldFile matches a known default photo path
        return pathOldFile.equals(path); // Adjust the default photo path as needed
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
