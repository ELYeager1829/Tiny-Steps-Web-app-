<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tiny Steps | Login</title>

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
            padding:  1rem 2rem 4rem 2rem;
        }

        .login-card {
            background: #ffffff;
            padding: 3rem 2rem;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        .login-card h1 {
            font-size: 2.2rem;
            margin-bottom: 1rem;
            color: #333;
        }

        .login-card p {
            margin-bottom: 2rem;
            color: #555;
        }

        .login-card form {
            display: flex;
            flex-direction: column;
            gap: 1.2rem;
        }

        .login-card input[type="text"],
        .login-card input[type="password"] {
            padding: 0.75rem 1rem;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 1rem;
            width: 100%;
        }

        .login-card input[type="submit"] {
            padding: 0.75rem;
            font-size: 1rem;
            font-weight: 700;
            background-color: #87CEFA;
            color: #ffffff;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .login-card input[type="submit"]:hover {
            background-color: #00BFFF;
            transform: translateY(-2px);
        }

        /* Responsive */
        @media (max-width: 480px) {
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
           
            <a href="register.jsp">Register</a>
        </div>
    </nav>

    <!-- Main Content -->
    <section class="content">
        <div class="login-card">
            <h1>Login</h1>
            <p>Please provide your login details below</p>
            <form action="OnboardingServlet.do" method="POST">
                <input type="text" name="username" placeholder="Username" required />
                <input type="password" name="password" placeholder="Password" required />
                <input type="hidden" name="op" value="login" />
                <input type="submit" value="Sign In" />
            </form>
        </div>
    </section>

</body>
</html>
