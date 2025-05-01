<%-- 
    Document   : teachersDash
    Created on : 01 May 2025, 8:03:00 AM
    Author     : Student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Tiny Steps | Teachers Dashboard</title>

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

        /* Banner */
        .banner {
            display: flex;
            width: 100%;
            height: 250px;
            overflow: hidden;
            margin-top: 1rem;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .banner img {
            width: 100%;
            object-fit: cover;
        }

        /* Dashboard Buttons */
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

        /* Mobile Responsive */
        @media (max-width: 600px) {
            .navbar {
                flex-direction: column;
                gap: 0.5rem;
            }

            .navbar .nav-links {
                flex-direction: column;
                gap: 0.5rem;
            }

            .banner {
                flex-direction: column;
                height: auto;
            }

            .banner img {
                height: 150px;
            }
        }
        /* Banner Styling */
        .banner {
            display: flex;
            width: 100%;
            height: 250px;
            overflow: hidden;
            margin-top: 1rem;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .banner-image {
            flex: 1;
            overflow: hidden;
        }

        .banner-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }



    </style>

    <!-- Navbar -->
    <nav class="navbar">
        <a href="welcome.jsp" class="logo">Tiny Steps</a>
        <div class="nav-links">
            <a href="index.html">Logout</a>
        </div>
    </nav>

    <!-- Banner Section -->

    <%
        String op = request.getParameter("op");
        String name = request.getParameter("teacherFullName");
    %>

    <body>
        <form action="TeachersServlet.do" method="POST">
            <h2>Welcome ,<%=name%></h2>
            <section class="dashboard">
                <a href="student_list.jsp">
                    <input type="hidden" name="op" value="viewProfile" />
                    <h3>View Students </h3>
                    <p>View list of students</p>
                </a>

                <a href="student_profile.jsp">
                    <input type="hidden" name="op" value="viewProfile" />
                    <h3>View Student Profile</h3>
                    <p>Check your student's profile details</p>
                </a>

                <a href="attendance.jsp">
                    <input type="hidden" name="op" value="viewProfile" />
                    <h3>Make Daily Attendance</h3>
                    <p>Tracking student attendance </p>
                </a>

                <a href="daily_report.jsp">
                    <input type="hidden" name="op" value="viewProfile" />
                    <h3>Make Daily report</h3>
                    <p>Tracking student development</p>
                </a>

                <a href="parent_queries.jsp">
                    <input type="hidden" name="op" value="viewProfile" />
                    <h3>View Parent Enquries </h3>
                    <p>Chat with parents</p>
                </a>

                <a href="class_schedule.jsp">
                    <input type="hidden" name="op" value="viewProfile" />
                    <h3>See class schedule</h3>
                    <p>View weeks class curriculum</p>
                </a>
            </section>

        </form>


    </body>
</html>
