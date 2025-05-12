/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.ParentFacadeLocal;
import za.ac.tut.ejb.bl.StudentFacadeLocal;
import za.ac.tut.ejb.bl.TeacherFacadeLocal;
import za.ac.tut.ejb.bl.UserFacadeLocal;
import za.ac.tut.entities.Parent;
import za.ac.tut.entities.Student;
import za.ac.tut.entities.Teacher;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import za.ac.tut.ejb.bl.AnnouncementFacadeLocal;
import za.ac.tut.ejb.bl.ClassroomFacadeLocal;
import za.ac.tut.entities.Announcement;
import za.ac.tut.entities.AppUser;
import za.ac.tut.entities.Classroom;

    
/**
 *
 * @author olwet
 */
public class AdminServlet extends HttpServlet {

    @EJB
    private StudentFacadeLocal sfl;
    @EJB
    private UserFacadeLocal ufl;
    @EJB
    private TeacherFacadeLocal tfl;
    @EJB
    private ParentFacadeLocal pfl;
    @EJB
    private ClassroomFacadeLocal cfl;
    @EJB
    private AnnouncementFacadeLocal afl;
    
    private static final Logger logger = Logger.getLogger(AdminServlet.class.getName());
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op=request.getParameter("op");
        
        if(op.equals("add_student"))
        {
            List<Parent> parents = pfl.findAll();
            List<Teacher> teachers = tfl.findAll();
            List<Classroom> classrooms = cfl.findAll();
            
            request.setAttribute("parents",parents);
            request.setAttribute("teachers",teachers);
            request.setAttribute("classrooms",classrooms);
            
            RequestDispatcher disp = request.getRequestDispatcher("add_student.jsp");
            disp.forward(request, response);
        }
        else if(op.equals("manage_student"))
        {
                
            List<Student> student = sfl.findAll();

            request.setAttribute("students",student);

            logger.info("Redict in Manage student page");

            RequestDispatcher disp = request.getRequestDispatcher("manage_student.jsp");
            disp.forward(request, response);
        }
        else if(op.equals("manage_classroom"))
        {
            List<Classroom> classrooms = cfl.findAll();
        
            request.setAttribute("classrooms",classrooms);
                
            RequestDispatcher disp = request.getRequestDispatcher("manage_classroom.jsp");
            disp.forward(request, response);
        }
        else if(op.equals("manage_communication"))
        {
            List<Announcement> announcements = afl.findAll();
            
            request.setAttribute("announcements",announcements);
            
            RequestDispatcher disp = request.getRequestDispatcher("manage_communication.jsp");
            disp.forward(request, response);
        }
        else if(op.equals("editBtn"))
        {
            String strStudent = request.getParameter("id");
            
            
            if(strStudent !=null)
            {
                
                Integer studentId= Integer.parseInt(strStudent);
                Student student =sfl.find(studentId);
                
                List<Parent> parents = pfl.findAll();
                List<Teacher> teachers = tfl.findAll();
                List<Classroom> classrooms = cfl.findAll();
            
                request.setAttribute("parents",parents);
                request.setAttribute("teachers",teachers);
                request.setAttribute("classrooms",classrooms);
                
                request.setAttribute("student", student);
                
                RequestDispatcher disp = request.getRequestDispatcher("edit_student_outcome.jsp");
                disp.forward(request, response);
            }
        }
        else if(op.equals("deleteBtn"))
        {
            String student = request.getParameter("id");
            
            if(student !=null)
            {
                Integer studentId = Integer.parseInt(student);
                
                Student students = sfl.find(studentId);
                sfl.remove(students);

                RequestDispatcher disp = request.getRequestDispatcher("remove_student_outcome.jsp");
                disp.forward(request,response);
                
   
            }
        }
         else if(op.equals("cEditBtn"))
        {
            String classroom = request.getParameter("id");
            
            if(classroom !=null)
            {
                Long classroomId = Long.parseLong(classroom);
                Classroom classrooms = cfl.find(classroomId);
                
                request.setAttribute("classrooms", classrooms);
                
                RequestDispatcher disp = request.getRequestDispatcher("edit_classroom_outcome.jsp");
                disp.forward(request, response);
            }
        }
        else if(op.equals("cDeleteBtn"))
        {
            String classroom = request.getParameter("id");
            
            if(classroom !=null)
            {
                Long classroomId = Long.parseLong(classroom);
                Classroom classrooms = cfl.find(classroomId);
                
                cfl.remove(classrooms);
                
                RequestDispatcher disp = request.getRequestDispatcher("remove_classroom_outcome.jsp");
                disp.forward(request, response);
            }
        }
       
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        String url = "index.html";
        
        if(op.equals("add"))
        {
            String fullname = request.getParameter("fullName");
            String dob = request.getParameter("dateOfBirth");
            String gender = request.getParameter("gender");
            String parents = request.getParameter("parentId");
            String teachers = request.getParameter("teacherId");
            String classroomId = request.getParameter("classroomId");
            
            if(fullname !=null && dob != null && gender !=null && parents !=null && teachers !=null && classroomId !=null)
            {
                LocalDate dateOfBirth = LocalDate.parse(dob); 
                Integer parentId =Integer.parseInt(parents);
                Integer teacherId = Integer.parseInt(teachers);
                Classroom classroom = cfl.find(Long.parseLong(classroomId));
                
                Parent parent = pfl.find(parentId);
                Teacher teacher = tfl.find(teacherId);
               
                Student student = new Student();
                student.setParent(parent);
                student.setTeacher(teacher);
                student.setFullName(fullname);
                student.setDateOfBirth(dateOfBirth);
                student.setClassroom(classroom);
                
                if(gender.equals("MALE"))
                {
                    student.setGender(Student.Gender.MALE);
                }
                else if(gender.equals("FEMALE"))
                {
                    student.setGender(Student.Gender.FEMALE);
                }
                else
                {
                    student.setGender(Student.Gender.OTHER);
                }
                
                sfl.create(student);
                
                logger.warning("The student has been successfully added");
                
                List<Student> students =sfl.findAll();
               
                request.setAttribute("students",students);
                
                RequestDispatcher disp = request.getRequestDispatcher("manage_student.jsp");
                disp.forward(request, response);
                
            }
             else {
                request.setAttribute("error_msg", "All parent fields are required.");
                url = "add_student.jsp";
            }
            
        }
        else if(op.equals("classroom"))
        {
           
            String classroomName = request.getParameter("classroom_name");
            
            if(classroomName !=null )
            {
                Classroom classroom = new Classroom();
                classroom.setName(classroomName);
                
                cfl.create(classroom);
                
                List<Classroom> classrooms = cfl.findAll();
        
                request.setAttribute("classrooms",classrooms);
                
                RequestDispatcher disp = request.getRequestDispatcher("manage_classroom.jsp");
                disp.forward(request, response);
            }
        }else if(op.equals("send"))
        {
            
            String recipient = request.getParameter("recipientType").toUpperCase();
            String subject = request.getParameter("subject");
            String message = request.getParameter("message");
            
            
            Announcement.TargetRole role = Announcement.TargetRole.valueOf(recipient);

                HttpSession session = request.getSession();
                AppUser userSession =(AppUser) session.getAttribute("loggerUser");
                AppUser user = ufl.find(userSession.getUserId());
                logger.info("Redict in Manage student page"+ user.getUserId());
                Announcement announce = new Announcement();
                announce.setTitle(subject);
                announce.setBody(message);
                announce.setTargetRole(role);
                announce.setPostedAt(LocalDateTime.MAX);
                announce.setPostedBy(user);
                
                afl.create(announce);
                List<Announcement> announcements = afl.findAll();
                
                request.setAttribute("announcements",announcements);
                
                RequestDispatcher disp = request.getRequestDispatcher("manage_communication.jsp");
                disp.forward(request, response);
               
            
        }
        if(op.equals("EDIT"))
        {
            String fullname = request.getParameter("fullName");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            String parents = request.getParameter("parent");
            String teachers = request.getParameter("teacher");
            String classroomId = request.getParameter("classroom");
            
            if(fullname !=null && dob != null && gender !=null && parents !=null && teachers !=null && classroomId !=null)
            {
                LocalDate dateOfBirth = LocalDate.parse(dob);
                Integer parentId =Integer.parseInt(parents);
                Integer teacherId = Integer.parseInt(teachers);
                Classroom classroom = cfl.find(Long.parseLong(classroomId));
                Parent parent = pfl.find(parents);
                Teacher teacher = tfl.find(teachers);
               
                Student student = new Student();
                student.setParent(parent);
                student.setTeacher(teacher);
                student.setFullName(fullname);
                student.setDateOfBirth(dateOfBirth);
                student.setClassroom(classroom);
                
                sfl.edit(student);
                RequestDispatcher disp = request.getRequestDispatcher("manage_student.jsp");
                disp.forward(request, response);
            }
        }
       
        else if(op.equals("CEDIT"))
        {
            String name = request.getParameter("name");
            String classroomId = request.getParameter("id");
            if(name != null)
            {
                Classroom classrooms = cfl.find(Long.parseLong(classroomId));
                
                classrooms.setName(name);
                
                cfl.edit(classrooms);
                logger.info("Redict in Classroom student page");
                
                RequestDispatcher disp = request.getRequestDispatcher("manage_classroom.jsp");
                disp.forward(request, response);
            }
        }
        
        
    }

   
    
    

}
