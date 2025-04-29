/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import za.ac.tut.ejb.bl.ParentFacade;
import za.ac.tut.ejb.bl.ParentFacadeLocal;
import za.ac.tut.ejb.bl.TeacherFacadeLocal;
import za.ac.tut.ejb.bl.UserFacadeLocal;
import za.ac.tut.entities.AppUser;
import za.ac.tut.entities.AppUser.Role;
import za.ac.tut.entities.Parent;
import za.ac.tut.entities.Teacher;

/**
 *
 * @author user
 */
@MultipartConfig
public class OnboardingServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OnboardingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OnboardingServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    @EJB
    private UserFacadeLocal ufl;
    @EJB
    private ParentFacadeLocal pfl;
    @EJB
    private TeacherFacadeLocal tfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("op");
        String url = "index.html";

        if ("register".equals(op)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String role = request.getParameter("role");

            if (username != null && password != null && role != null) {
                AppUser theUser = new AppUser();
                theUser.setUsername(username);
                theUser.setPassword(password);
                theUser.setCreatedAt(new Date());

                if ("TEACHER".equals(role)) {
                    theUser.setRole(AppUser.Role.TEACHER);
                    String fullname = request.getParameter("teacherFullName");
                    String phone = request.getParameter("teacherPhone");
                    String email = request.getParameter("teacherEmail");
                    if (fullname != null && phone != null && email != null) {
                        ufl.create(theUser);
                        Teacher theTeacher = new Teacher();
                        theTeacher.setFullName(fullname);
                        theTeacher.setEmail(email);
                        theTeacher.setPhone(phone);
                        theTeacher.setUser(theUser);

                        tfl.create(theTeacher);

                        url = "login.jsp";
                    } else {
                        request.setAttribute("error_msg", "All Teacher fields are required.");
                        url = "register.jsp";
                    }

                } else if ("ADMIN".equals(role)) {

                    //work on this
                    theUser.setRole(AppUser.Role.ADMIN);
                    ufl.create(theUser);
                    url = "login.jsp";

                } else if ("PARENT".equals(role)) {
                    theUser.setRole(AppUser.Role.PARENT);

                    String fullname = request.getParameter("parentFullName");
                    String phone = request.getParameter("parentPhone");
                    String email = request.getParameter("parentEmail");
                    String address = request.getParameter("parentAddress");

                    if (fullname != null && phone != null && email != null && address != null) {
                        // Save the user first
                        ufl.create(theUser);

                        // Now create and link the parent
                        Parent theParent = new Parent();
                        theParent.setFullName(fullname);
                        theParent.setPhone(phone);
                        theParent.setEmail(email);
                        theParent.setAddress(address);
                        theParent.setUser(theUser); // Important: link parent to user

                        pfl.create(theParent);

                        url = "login.jsp";
                    } else {
                        request.setAttribute("error_msg", "All parent fields are required.");
                        url = "register.jsp";
                    }

                } else {
                    request.setAttribute("error_msg", "Invalid role selected.");
                    url = "register.jsp";
                }

            } else {
                request.setAttribute("error_msg", "All fields must be filled.");
                url = "register.jsp";
            }
        }else if ("login".equals(op)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username != null && password != null && !username.isEmpty() && !password.isEmpty()) {
                List<AppUser> users = ufl.findAll();
                boolean loginSuccess = false;

                for (AppUser user : users) {
                    if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                        Role role = user.getRole();
                        if(role==Role.PARENT){
                            url="p_dashboard.jsp";
                        }
                        else if(role==Role.ADMIN)
                        {
                            url="a_dashboard.jsp";
                        }
                        else
                        {
                            url="t_dashboard.jsp";
                        }
                        
                        request.setAttribute("user", user);
                        loginSuccess = true;
                        break;
                    }
                }

                if (!loginSuccess) {
                    request.setAttribute("error_msg", "Invalid username or password.");
                    url = "login.jsp";
                }
                else{
                    url="p_dashboard.jsp";
                }
            } else {
                request.setAttribute("error_msg", "All fields must be filled.");
                url = "login.jsp";
            }
        }
        else if("pay".equals(op) && op!=null)
        {
            Integer month = Integer.parseInt(request.getParameter("month"));
            Part filePart=request.getPart("pay");
            String message;
            if(filePart!=null && filePart.getSize()>0){
                String fileName= filePart.getSubmittedFileName();
                message="payment received!!";
                request.setAttribute("message", message);
                request.setAttribute(fileName, op);
                url="payment_output.jsp";
            }
            
        }

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
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
