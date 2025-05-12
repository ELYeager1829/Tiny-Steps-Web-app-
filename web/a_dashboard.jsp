<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tiny Steps | Admin Dashboard</title>
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

        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 2rem;
            padding: 2rem;
            margin-top: 2rem;
        }

        .dashboard a {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 20px;
            text-align: center;
            text-decoration: none;
            color: #333;
            font-weight: 700;
            box-shadow: 0 6px 16px rgba(0,0,0,0.1);
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .dashboard a:hover {
            background-color: #87CEFA;
            color: #ffffff;
            transform: translateY(-5px);
        }

        .dashboard a h3 {
            margin-bottom: 0.5rem;
            font-size: 1.4rem;
        }

        @media (max-width: 600px) {
            .navbar {
                flex-direction: column;
                gap: 0.5rem;
            }

            .navbar .nav-links {
                flex-direction: column;
                gap: 0.5rem;
            }
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar">
        <a href="a_dashboard.jsp" class="logo">Tiny Steps</a>
        <div class="nav-links">
            <a href="index.html">Logout</a>
        </div>
    </nav>

    <!-- Dashboard -->
    <section class="dashboard">
        <a href="AdminServlet.do?op=add_student">
            <h3>Add Student</h3>
            <p>Register a new student</p>
        </a>

        <a href="AdminServlet.do?op=manage_student">
            <h3>Student Management</h3>
            <p>View and manage student data</p>
        </a>

        <a href="AdminServlet.do?op=manage_classroom">
            <h3>Classroom Management</h3>
            <p>Organize classrooms and assign students</p>
        </a>

        <a href="AdminServlet.do?op=manage_communication">
            <h3>Announcements & Communication</h3>
            <p>Send updates to parents and staff</p>
        </a>

        <a href="reports.jsp">
            <h3>Reports & Analysis</h3>
            <p>View performance and attendance reports</p>
        </a>

        <a href="config.html">
            <h3>App Configuration</h3>
            <p>Manage settings and preferences</p>
        </a>
    </section>

</body>
</html>
