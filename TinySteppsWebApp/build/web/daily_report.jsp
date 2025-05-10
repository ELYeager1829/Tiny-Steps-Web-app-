<%@page import="za.ac.tut.model.entity.Student"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Log Daily Report</title>
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
            max-width: 700px;
            margin: auto;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 1rem;
        }

        label {
            font-weight: bold;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 0.6rem;
            margin-top: 0.3rem;
            margin-bottom: 1rem;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #87CEFA;
            color: white;
            font-weight: bold;
            padding: 0.6rem 1.2rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #00BFFF;
        }

        .back-btn {
            display: inline-block;
            margin-top: 1rem;
            text-decoration: none;
            background-color: #ccc;
            color: black;
            padding: 0.6rem 1rem;
            border-radius: 5px;
        }

        .back-btn:hover {
            background-color: #aaa;
        }
    </style>
</head>
<body>

<%
    Student student = (Student) request.getAttribute("student");
%>

<div class="container">
    <h2>Log Daily Report for <%= student.getFullName() %></h2>

    <form action="TeachersServlet.do" method="post">
        <input type="hidden" name="logActivity" value="<%= student.getStudentId() %>">

        <label>Meals:</label>
        <input type="text" name="meals" required>

        <label>Naps:</label>
        <input type="text" name="naps" required>

        <label>Health Info:</label>
        <input type="text" name="health" required>

        <input type="submit" value="Submit Report">
    </form>

    
</div>

</body>
</html>
