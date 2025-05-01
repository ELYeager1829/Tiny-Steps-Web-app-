/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.controller;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import za.ac.tut.model.bl.DailyReportsFacadeLocal;
import za.ac.tut.model.bl.StudentFacadeLocal;
import za.ac.tut.model.bl.TeacherFacadeLocal;
import za.ac.tut.model.entity.DailyReports;
import za.ac.tut.model.entity.Student;
import za.ac.tut.model.entity.Teacher;

/**
 *
 * @author Student
 */
public class TeachersServlet extends HttpServlet {

    @EJB
    private TeacherFacadeLocal tfl;
    @EJB
    private StudentFacadeLocal sfl;
    @EJB
    private DailyReportsFacadeLocal dfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        String url = "t_dashboard.jsp";

        HttpSession session = request.getSession(false);
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        Student student = (Student) session.getAttribute("student");

        List<Student> students = teacher.getStudents();
        List<DailyReports> activities = student.getActivities();

        if (op == null || teacher == null) {
            request.setAttribute("error_msg", "Unauthorized access or missing operation.");
            url = "login.jsp";
        } else if ("viewProfile".equals(op)) {
            teacher = tfl.find(teacher.getTeacherId());
            request.setAttribute("teacher", teacher);
            request.setAttribute("students", students);
            url = "student_list.jsp";
        } else if ("viewStudent".equals(op)) {
            String studentId = request.getParameter("studentId");
            Student selected = sfl.find(studentId);
            if (selected != null) {
                session.setAttribute("selectedStudent", selected);
                request.setAttribute("student", selected);
                request.setAttribute("activities", activities);
                url = "student_profile.jsp";
            } else {
                request.setAttribute("error_msg", "Student not found.");
                url = "t_dashboard.jsp";
            }
        } else if ("markAttendance".equals(op)) {
            String studentId = request.getParameter("studentId");
            String status = request.getParameter("status");
            Student selected = sfl.find(studentId);
            if (selected != null) {
                request.setAttribute("selectedStudent", selected);
                request.setAttribute("student", selected);
                request.setAttribute("status", status);
                // Load past attendance records if needed
                //request.setAttribute("attendanceRecords", selected.getAttendances());
                url = "attendance.jsp";
            } else {
                request.setAttribute("error_msg", "Student not found.");
                url = "t_dashboard.jsp";
            }
           
        } else if ("viewParentQueries".equals(op)) {
            url = "parent_queries.jsp";
        } else if ("viewSchedule".equals(op)) {
            url = "class_schedule.jsp";
        } else if ("logActivity".equals(op)) {

            if (student != null) {
                DailyReports activity = new DailyReports();
                activity.setStudent(student);
                activity.setDate(new Date());
                activity.setMealInfo(request.getParameter("meals"));
                activity.setNapInfo(request.getParameter("naps"));
                activity.setHealthInfo(request.getParameter("health"));

                dfl.create(activity);
                request.setAttribute("message", "Activity logged successfully.");
                request.setAttribute("student", student);
                request.setAttribute("activities", student.getActivities());
                url = "student_profile.jsp";
            } else {
                request.setAttribute("error_msg", "No student selected.");
                url = "t_dashboard.jsp";
            }
        }

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

}
