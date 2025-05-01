/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.controller;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import za.ac.tut.model.bl.AppUserFacadeLocal;
import za.ac.tut.model.bl.ParentFacadeLocal;
import za.ac.tut.model.bl.TeacherFacadeLocal;
import za.ac.tut.model.entity.AppUser;
import za.ac.tut.model.entity.AppUser.Role;
import za.ac.tut.model.entity.Parent;
import za.ac.tut.model.entity.Teacher;

/**
 *
 * @author user
 */
@MultipartConfig
public class OnboardingServlet extends HttpServlet {

   
    @EJB
    private AppUserFacadeLocal ufl;
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

   
}
