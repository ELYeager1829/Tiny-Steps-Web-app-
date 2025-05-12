<%@page import="za.ac.tut.entities.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tiny Steps | Child Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;800&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Nunito', sans-serif;
            background: linear-gradient(135deg, #87CEFA, #FFD1DC, #FFFACD);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Navbar */
        .navbar {
            width: 100%;
            background-color: #ffffff;
            padding: 1rem 2rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .navbar .logo {
            font-size: 1.8rem;
            font-weight: 800;
            color: #87CEFA;
            text-decoration: none;
        }

        .navbar .nav-links {
            display: flex;
            gap: 1rem;
        }

        .navbar .nav-links a {
            padding: 0.5rem 1.2rem;
            background-color: #87CEFA;
            color: #ffffff;
            font-weight: 600;
            text-decoration: none;
            border-radius: 30px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .navbar .nav-links a:hover {
            background-color: #00BFFF;
            transform: translateY(-2px);
        }

        /* Container */
        .container {
            max-width: 700px;
            background-color: #ffffff;
            margin: 3rem auto;
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .container h1 {
            text-align: center;
            margin-bottom: 2rem;
            color: #333;
        }

        form {
            display: flex;
            justify-content: center;
            margin-bottom: 2rem;
        }

        input[type="submit"] {
            padding: 0.8rem 1.5rem;
            background-color: #87CEFA;
            border: none;
            border-radius: 30px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #00BFFF;
            transform: translateY(-2px);
        }

        .profile-details {
            font-size: 1.1rem;
            color: #444;
            line-height: 1.8;
        }

        .back-link {
            margin-top: 2rem;
            text-align: center;
        }

        .back-link a {
            text-decoration: none;
            color: #87CEFA;
            font-weight: 600;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            .container {
                margin: 2rem 1rem;
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar">
        <a href="welcome.jsp" class="logo">Tiny Steps</a>
        <div class="nav-links">
            <a href="index.html">Logout</a>
        </div>
    </nav>

    <!-- Content -->
    <div class="container">
        <h1>Child Profile</h1>

        <form action="OnboardingServlet.do" method="post">
            <input type="hidden" name="op" value="prof">
            <input type="submit" value="View Profile">
        </form>

        <div class="profile-details">
            <%
                Student student = (Student) request.getAttribute("student");
                if (student != null) {
            %>
                <p><strong>Full name:</strong> <%=student.getFullName()%></p>
                <p><strong>Date of birth:</strong> <%=student.getDateOfBirth()%></p>
                <p><strong>Gender:</strong> <%=student.getGender()%></p>
                <p><strong>Teacher:</strong>
                    <%= student.getTeacher() != null ? student.getTeacher().getFullName() : "Not Assigned" %>
                </p>
                <p><strong>Parent:</strong>
                    <%= student.getParent() != null ? student.getParent().getFullName() : "Not Available" %>
                </p>
            <%
                }
            %>
        </div>

        <div class="back-link">
            <p>Click <a href="p_dashboard.jsp">here</a> to go back to the dashboard</p>
        </div>
    </div>

</body>
</html>
