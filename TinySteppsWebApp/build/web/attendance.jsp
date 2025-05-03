<%@page import="za.ac.tut.model.entity.Student"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mark Attendance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 2rem;
            background-color: #f0f8ff;
        }

        h2 {
            color: #2c3e50;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
            background-color: white;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 0.75rem;
            text-align: center;
        }

        th {
            background-color: #d1ecf1;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        input[type="submit"] {
            margin-top: 1rem;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<h2>Mark Attendance</h2>

<%
    List<Student> students = (List<Student>) request.getAttribute("students");
    if (students == null || students.isEmpty()) {
%>
    <p>No students found for this teacher.</p>
<%
    } else {
%>
    <form action="attendance_output.jsp" method="post">
        <table>
            <tr>
                <th>Student Number</th>
                <th>Full Name</th>
                <th>Present</th>
            </tr>
            <%
                for (int i = 0; i < students.size(); i++) {
                    Student s = students.get(i);
            %>
            <tr>
                <td><%= s.getStudentId() %></td>
                <td><%= s.getFullName() %></td>
                <td>
                    <input type="checkbox" name="present" value="<%= s.getStudentId() %>">
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <input type="submit" value="Submit Attendance">
    </form>
<%
    }
%>

</body>
</html>
