<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entities.Student"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Students</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Nunito', sans-serif;
            background: linear-gradient(135deg, #87CEFA, #FFD1DC, #FFFACD);
            margin: 0;
            padding: 0;
        }

        .navbar {
            width: 100%;
            background-color: #ffffff;
            padding: 1rem 2rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar .logo {
            font-size: 1.8rem;
            font-weight: 800;
            color: #87CEFA;
            text-decoration: none;
        }

        .container {
            max-width: 1000px;
            margin: 3rem auto;
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 2rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 1rem;
        }

        th, td {
            padding: 0.8rem;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #87CEFA;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            padding: 0.4rem 0.8rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
        }

        .edit-btn {
            background-color: #FFD700;
            color: #333;
        }

        .delete-btn {
            background-color: #FF6B6B;
            color: white;
        }

        .add-btn {
            display: inline-block;
            margin-bottom: 1.5rem;
            padding: 0.6rem 1.2rem;
            background-color: #00BFFF;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .add-btn:hover {
            background-color: #009ACD;
        }
        button:hover {
            background-color: #FF6347;
        }

        .back-link {
            display: inline-block;
            margin-top: 1.2rem;
            text-decoration: none;
            color: #FFA07A;
            font-weight: 600;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <a href="a_dashboard.jsp" class="logo">Tiny Steps</a>
        <a href="index.html" style="text-decoration:none; font-weight:600; color:#87CEFA;">Logout</a>
    </div>

    <div class="container">
        <h2>Manage Students</h2>

        <a class="add-btn" href="add_student.jsp">+ Add New Student</a>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Date of Birth</th>
                    <th>Gender</th>
                    <th>Class Group</th>
                    <th>Parent</th>
                    <th>Teacher</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Student> students = (List<Student>) request.getAttribute("students");
                    if (students != null && !students.isEmpty()) {
                        for (Student student : students) {
                %>
                <tr>
                    <td><%= student.getStudentId() %></td>
                    <td><%= student.getFullName() %></td>
                    <td><%= student.getDateOfBirth() %></td>
                    <td><%= student.getGender() %></td>
                    <td><%= student.getClassroom().getName() %></td>
                    <td><%= student.getParent() != null ? student.getParent().getFullName() : "N/A" %></td>
                    <td><%= student.getTeacher() != null ? student.getTeacher().getFullName() : "N/A" %></td>
                    <td>
                        <a href="AdminServlet.do?id=<%= student.getStudentId() %>&op=editBtn" class="btn edit-btn">Edit</a>
                        <a href="AdminServlet.do?id=<%= student.getStudentId() %>&op=deleteBtn" class="btn delete-btn" onclick="return confirm('Are you sure you want to delete this student?');">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="8">No students found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
            <a class="back-link" href="a_dashboard.jsp">← Back to Dashboard</a>
    </div>

</body>
</html>
