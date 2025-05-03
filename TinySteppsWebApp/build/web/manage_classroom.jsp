<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entities.Classroom"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Classrooms</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Nunito', sans-serif;
            background: linear-gradient(135deg, #FFD1DC, #E0FFFF, #F0FFF0);
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
            color: #FFA07A;
            text-decoration: none;
        }

        .container {
            max-width: 800px;
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
            background-color: #FFA07A;
            color: white;
        }

        tr:hover {
            background-color: #f9f9f9;
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
            background-color: #FFA07A;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .add-btn:hover {
            background-color: #FF6347;
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
        <a href="index.html" style="text-decoration:none; font-weight:600; color:#FFA07A;">Logout</a>
    </div>

    <div class="container">
        <h2>Manage Classrooms</h2>

        <a class="add-btn" href="add_classroom.jsp">+ Add New Classroom</a>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Class Group</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Classroom> classrooms = (List<Classroom>) request.getAttribute("classrooms");
                    if (classrooms != null && !classrooms.isEmpty()) {
                        for (Classroom classroom : classrooms) {
                %>
                <tr>
                    <td><%= classroom.getId() %></td>
                    <td><%= classroom.getClassGroup() %></td>
                    <td>
                        <a href="EditClassroomServlet?id=<%= classroom.getId() %>" class="btn edit-btn">Edit</a>
                        <a href="DeleteClassroomServlet?id=<%= classroom.getId() %>" class="btn delete-btn" onclick="return confirm('Are you sure you want to delete this classroom?');">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="3">No classrooms found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
            <a class="back-link" href="a_dashboard.jsp">← Back to Dashboard</a>
    </div>

</body>
</html>
