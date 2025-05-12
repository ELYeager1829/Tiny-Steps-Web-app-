<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tiny Steps | Register</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;800&display=swap" rel="stylesheet">

    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Nunito', sans-serif;
            background: linear-gradient(135deg, #87CEFA, #FFD1DC, #FFFACD);
            min-height: 100vh;
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

        /* Content */
        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 1rem 2rem 4rem 2rem;
        }

        .register-card {
            background: #ffffff;
            padding: 2.5rem 2rem;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
        }

        .register-card h1 {
            font-size: 2.2rem;
            margin-bottom: 1rem;
            color: #333;
            text-align: center;
        }

        .register-card p {
            text-align: center;
            margin-bottom: 2rem;
            color: #555;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        label {
            font-weight: 600;
            margin-bottom: 0.3rem;
            display: block;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        select,
        textarea {
            padding: 0.75rem 1rem;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 1rem;
            width: 100%;
        }

        textarea {
            resize: vertical;
            min-height: 80px;
        }

        input[type="submit"] {
            padding: 0.75rem;
            font-size: 1rem;
            font-weight: 700;
            background-color: #87CEFA;
            color: #ffffff;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            margin-top: 1rem;
        }

        input[type="submit"]:hover {
            background-color: #00BFFF;
            transform: translateY(-2px);
        }

        .hidden {
            display: none;
        }

        .section-header {
            margin-top: 2rem;
            font-weight: 700;
            color: #555;
        }

        .error-message {
            color: red;
            margin-top: 1rem;
            text-align: center;
            font-weight: 600;
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
        <a href="welcome.jsp" class="logo">Tiny Steps</a>
        <div class="nav-links">
            <a href="login.jsp">Login</a>
            
        </div>
    </nav>

    <!-- Main Content -->
    <section class="content">
        <div class="register-card">
            <h1>Register</h1>
            <p>Please provide your account information below</p>

            <form action="OnboardingServlet.do" method="POST">
                <label for="username">Username:</label>
                <input type="text" name="username" id="username" required>

                <label for="password">Password:</label>
                <input type="password" name="password" id="password" required>

                <label for="role">Role:</label>
                <select name="role" id="role" onchange="showFields()">
                    <option value="ADMIN">Admin</option>
                    <option value="TEACHER">Teacher</option>
                    <option value="PARENT">Parent</option>
                </select>

                <!-- Parent Fields -->
                <div id="parentFields" class="hidden">
                    <p class="section-header">Parent Details</p>
                    <label for="parentFullName">Full Name:</label>
                    <input type="text" name="parentFullName" id="parentFullName">

                    <label for="parentPhone">Phone:</label>
                    <input type="text" name="parentPhone" id="parentPhone">

                    <label for="parentEmail">Email:</label>
                    <input type="email" name="parentEmail" id="parentEmail">

                    <label for="parentAddress">Address:</label>
                    <textarea name="parentAddress" id="parentAddress"></textarea>
                </div>

                <!-- Teacher Fields -->
                <div id="teacherFields" class="hidden">
                    <p class="section-header">Teacher Details</p>
                    <label for="teacherFullName">Full Name:</label>
                    <input type="text" name="teacherFullName" id="teacherFullName">

                    <label for="teacherPhone">Phone:</label>
                    <input type="text" name="teacherPhone" id="teacherPhone">

                    <label for="teacherEmail">Email:</label>
                    <input type="email" name="teacherEmail" id="teacherEmail">
                </div>

                <input type="hidden" name="op" value="register">
                <input type="submit" value="Register">
            </form>

            <!-- Error Message if exists -->
            <%
                String errorMsg = (String) request.getAttribute("error_msg");
                if (errorMsg != null) {
            %>
                <div class="error-message"><%=errorMsg%></div>
            <%
                }
            %>
        </div>
    </section>

    <script>
        function showFields() {
            const role = document.getElementById("role").value;
            document.getElementById("parentFields").style.display = role === "PARENT" ? "block" : "none";
            document.getElementById("teacherFields").style.display = role === "TEACHER" ? "block" : "none";
        }
        window.onload = showFields;
    </script>

</body>
</html>
