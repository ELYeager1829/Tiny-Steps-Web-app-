<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tiny Steps | Parent Queries</title>
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

        /* Form Section */
        .container {
            max-width: 600px;
            background-color: #ffffff;
            margin: 3rem auto;
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .container h1 {
            text-align: center;
            margin-bottom: 2rem;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 1.2rem;
        }

        label {
            font-weight: 600;
            color: #333;
        }

        input[type="text"],
        textarea {
            padding: 0.8rem;
            border: 1px solid #ccc;
            border-radius: 10px;
            width: 100%;
            resize: vertical;
            font-size: 1rem;
        }

        input[type="submit"] {
            padding: 0.8rem;
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

    <!-- Query Form Section -->
        <%
        String msg= (String)request.getAttribute("msg");
    %>
    <div class="container">
        <h1>Make a Query</h1>
        <form action="OnboardingServlet.do" method="post">
            <div>
                <label for="sub">Subject</label>
                <input type="text" name="sub" id="sub" required>
            </div>
            <div>
                <label for="query">Your Query</label>
                <textarea name="query" id="query" rows="6" required></textarea>
            </div>
            <input type="hidden" name="op" value="query">
            <input type="submit" value="Submit Query">
        </form>
        <p style="color: green"><%=msg%></p>
    </div>

    

</body>
</html>
