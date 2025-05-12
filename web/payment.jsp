<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tiny Steps | Make Payment</title>
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

        h1 {
            text-align: center;
            margin-bottom: 2rem;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        label {
            font-weight: 600;
            margin-bottom: 0.5rem;
            display: block;
        }

        input[type="number"],
        input[type="file"] {
            padding: 0.6rem;
            border: 1px solid #ccc;
            border-radius: 10px;
            width: 100%;
        }

        input[type="submit"] {
            padding: 0.8rem;
            background-color: #87CEFA;
            color: #fff;
            border: none;
            border-radius: 30px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #00BFFF;
            transform: translateY(-2px);
        }

        .back-link {
            text-align: center;
            margin-top: 2rem;
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

    <!-- Payment Form -->
    <div class="container">
        <h1>Make Payment</h1>
        <form action="OnboardingServlet.do" method="post" enctype="multipart/form-data">
            <div>
                <label for="month">What month are you paying for:</label>
                <input type="number" id="month" name="month" min="1" max="12" required>
            </div>
            <div>
                <label for="pay">Provide proof of payment:</label>
                <input type="file" id="pay" name="pay" required>
            </div>
            <input type="hidden" name="op" value="pay">
            <input type="submit" value="Submit Payment">
        </form>

        <div class="back-link">
            <p>Click <a href="p_dashboard.jsp">here</a> to go back to the dashboard</p>
        </div>
    </div>

</body>
</html>
