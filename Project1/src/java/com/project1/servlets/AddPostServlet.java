package com.project1.servlets;
import com.project1.dao.PostDao;
import com.project1.entities.Post;
import com.project1.entities.User;
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
public class AddPostServlet extends HttpServlet {

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
            String Title = request.getParameter("title");
            int Cid = Integer.parseInt(request.getParameter("cid"));
            String Content = request.getParameter("content");
            String Code = request.getParameter("code");
            Part part = request.getPart("picture");
            String Picture = part.getSubmittedFileName();
            // Getting current user Id From session
            HttpSession session = request.getSession();
            User user = (User)session.getAttribute("CurrentUser");
            int User_id= user.getId();
            Post post = new Post(Title, Content, Code, Picture, null, Cid, User_id);
            PostDao postdao = new PostDao(ConnectionProvider.getConnection());
            if(postdao.savePost(post)){
                out.println("Done");
                String path = request.getServletContext().getRealPath("/")+"Blog_Pics"+File.separator+ Picture;  
                Helper.saveFile(part.getInputStream(), path);
            }else{
                out.println("Error");
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
