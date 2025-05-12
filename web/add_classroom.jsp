<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Classroom</title>
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
            max-width: 600px;
            margin: 4rem auto;
            background-color: #ffffff;
            padding: 2rem 2.5rem;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 2rem;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: #555;
        }

        input[type="text"] {
            padding: 0.6rem;
            border: 1px solid #ccc;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            font-size: 1rem;
        }

        button {
            padding: 0.8rem;
            background-color: #FFA07A;
            color: white;
            border: none;
            border-radius: 10px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 1rem;
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
        <h2>Add New Classroom</h2>

        <form action="AdminServlet.do" method="post">
            <label for="classroom_name">Class Room Name</label>
            <input type="text" id="classroom_name" name="classroom_name" required>

            <button type="submit" name="op" value="classroom">Add Classroom</button>
        </form>

        <a class="back-link" href="manage_classroom.jsp">← Back to Classroom List</a>
    </div>

</body>
</html>
