<%-- 
    Document   : edit_student_outcome
    Created on : May 2, 2025, 5:11:28 PM
    Author     : olwet
--%>

<%@page import="za.ac.tut.entities.Classroom"%>
<%@page import="java.util.List"%>
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
                <td><input type="text" name="id" value="<%=student.getStudentId()%>" readonly=""/></td>
                <td><input type="text" name="fullName" value="<%=student.getFullName()%>" /></td>
                <td><input type="text" name="dob" value="<%=student.getDateOfBirth()%>"/></td>
                <td><input type="text" name="gender" value="<%=student.getGender()%>"/></td>
                <td>
                <%
                    List<Parent> parents = (List<Parent>)request.getAttribute("parents");
                %>
                   <select name="parentId" id="parentId" required>
                
                    <% 
                        if (parents != null) {
                            %><option value="">-- Select a Parent --</option><%
                            for (Parent parent : parents) {
                                if(student.getParent().equals(parent))
                                {
                    %>
                                <option selected value="<%= parent.getParentId() %>">
                                                <%= parent.getFullName() %>
                                </option>
                    <%
                        }else{
                                %>
                                <option value="<%= parent.getParentId() %>">
                                                <%= parent.getFullName() %>
                                </option>
                    <%
                              }
                            }
                        }
                        else
                        {
                           %><option disable value="">-- No Option to select --</option><% 
                        }
                    %>
                <!-- Populate dynamically from DB -->
            </select>
                </td>
                <td>
                <%
                    List<Teacher> teachers = (List<Teacher>) request.getAttribute("teachers");
                %>
                   <select name="teacherId" id="teacherId" required>
                
                    <% 
                        if (teachers != null) {
                            %><option value="">-- Select a Teacher --</option><%
                            for (Teacher teacher : teachers) {
                                if(student.getTeacher().equals(teacher))
                                {
                    %>
                                <option selected value="<%= teacher.getTeacherId() %>">
                                                <%= teacher.getFullName() %>
                                </option>
                    <%
                        }else{
                                %>
                                <option value="<%=teacher.getTeacherId()  %>">
                                                <%= teacher.getFullName() %>
                                </option>
                    <%
                              }
                            }
                        }
                        else
                        {
                           %><option disable value="">-- No Option to select --</option><% 
                        }
                    %>
                <!-- Populate dynamically from DB -->
            </select>
                </td>
                <td>
                <%
                    List<Classroom> classrooms = (List<Classroom>) request.getAttribute("classrooms");
                %>
                   <select name="classroomId" id="classroomId" required>
                
                    <% 
                        if (classrooms != null) {
                            %><option value="">-- Select a Teacher --</option><%
                            for (Classroom classroom : classrooms) {
                                if(student.getClassroom().equals(classroom))
                                {
                    %>
                                <option selected value="<%= classroom.getId() %>">
                                                <%= classroom.getName() %>
                                </option>
                    <%
                        }else{
                                %>
                                <option value="<%=classroom.getId()  %>">
                                                <%= classroom.getName() %>
                                </option>
                    <%
                              }
                            }
                        }
                        else
                        {
                           %><option disable value="">-- No Option to select --</option><% 
                        }
                    %>
                <!-- Populate dynamically from DB -->
            </select>
                </td>
                
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" name="op" value="EDIT"</td>
            </tr>
        </table>
        </form>
    </body>
</html>
