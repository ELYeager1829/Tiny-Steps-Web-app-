<%@page import="za.ac.tut.model.entity.Student"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="za.ac.tut.models.entity.Student" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mark Attendance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f7fa;
            padding: 2rem;
        }

        .container {
            background-color: #fff;
            padding: 2rem;
            border-radius: 10px;
            max-width: 600px;
            margin: auto;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 1rem;
        }

        label {
            font-weight: bold;
        }

        select, input[type="submit"] {
            padding: 0.6rem;
            font-size: 1rem;
            margin-top: 0.5rem;
            width: 100%;
            margin-bottom: 1.5rem;
        }

        .back-btn {
            display: inline-block;
            text-decoration: none;
            padding: 0.6rem 1rem;
            background-color: #87CEFA;
            color: white;
            border-radius: 5px;
        }

        .back-btn:hover {
            background-color: #00BFFF;
        }
    </style>
</head>
<body>

<%
    Student student = (Student) request.getAttribute("student");
%>

<div class="container">
    <h2>Mark Attendance for: <%= student.getFullName() %></h2>

    <form action="TeachersServlet.do" method="post">
        <!-- Hidden student ID to send back -->
        <input type="hidden" name="markAttendance" value="<%= student.getStudentId() %>">

        <label for="status">Attendance Status:</label>
        <select name="status" id="status" required>
            <option value="">-- Select Status --</option>
            <option value="Present">Present</option>
            <option value="Absent">Absent</option>
        </select>

        <input type="submit" value="Submit Attendance">
    </form>

</div>

</body>
</html>
