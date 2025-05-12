<%-- 
    Document   : edit_student_outcome
    Created on : May 2, 2025, 5:11:28 PM
    Author     : olwet
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="za.ac.tut.entities.Teacher"%>
<%@page import="za.ac.tut.entities.Parent"%>
<%@page import="za.ac.tut.entities.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit Student outcome Page</title>
    </head>
    <body>
        <h1>Edit Student</h1>
        <%
            Student student = (Student)request.getAttribute("student");

        %>
        <form action="AdminServlet.do" method="POST"> 
        <table border="1">
            <th>ID</th>
            <th>Name</th>
            <th>Birth Date</th>
            <th>Gender</th>
            <th>Parent</th>
            <th>Teacher</th>
            <th>Classroom</th>
            <tr>
                <td><input type="text" value="<%=student.getStudentId()%>" readonly=""/></td>
                <td><input type="text" value="<%=student.getFullName()%>" /></td>
                <td><input type="text" value="<%=student.getDateOfBirth()%>"/></td>
                <td><input type="text" value="<%=student.getGender()%>"/></td>
                <td><input type="text" value="<%=student.getParent()%>"/></td>
                <td><input type="text" value="<%=student.getTeacher()%>"/></td>
                <td><input type="text" value="<%=student.getClassroom()%>"/></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" name="op" value="EDIT"</td>
            </tr>
        </table>
        </form>
    </body>
</html>
