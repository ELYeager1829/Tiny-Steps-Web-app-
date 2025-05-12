<%-- 
    Document   : edit_classroom_outcome
    Created on : May 2, 2025, 6:08:19 PM
    Author     : olwet
--%>

<%@page import="za.ac.tut.entities.Classroom"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Classroom Outcome Page</title>
    </head>
    <body>
        <h1>Edit classroom</h1>
        <%
            Classroom classrooms = (Classroom)request.getAttribute("classrooms");
            
        %>
        <form action="AdminServlet.do" method="POST"> 
        <table border="1">
            <th>ID</th>
            <th>Name</th>
            <tr>
                <td><input type="text" name="id" value="<%=classrooms.getId()%>" readonly=""/></td>
                <td><input type="text" name="name" value="<%=classrooms.getName()%>" /></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" name="op" value="CEDIT"/></td>
            </tr>
        </table>
        </form>
    </body>
</html>
