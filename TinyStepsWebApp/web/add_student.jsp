<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Nunito', sans-serif;
            background: linear-gradient(135deg, #87CEFA, #FFD1DC, #FFFACD);
            min-height: 100vh;
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
            max-width: 600px;
            background-color: #ffffff;
            margin: 3rem auto;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 1.5rem;
        }

        form label {
            display: block;
            margin-top: 1rem;
            font-weight: 600;
        }

        form input, form select {
            width: 100%;
            padding: 0.8rem;
            margin-top: 0.3rem;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        button {
            width: 100%;
            padding: 1rem;
            background-color: #87CEFA;
            color: #ffffff;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            margin-top: 2rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #00BFFF;
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
        <h2>Add New Student</h2>
        <form action="AdminServlet.do" method="post">
            <label for="fullName">Full Name:</label>
            <input type="text" name="fullName" id="fullName" required>

            <label for="dateOfBirth">Date of Birth:</label>
            <input type="date" name="dateOfBirth" id="dateOfBirth" required>

            <label for="gender">Gender:</label>
            <select name="gender" id="gender" required>
                <option value="" disabled selected>Select gender</option>
                <option value="MALE">Male</option>
                <option value="FEMALE">Female</option>
                <option value="OTHER">Other</option>
            </select>

            <label for="parentId">Parent:</label>
            <select name="parentId" id="parentId" required>
                <option value="" disabled selected>Select parent</option>
                <option value="1">John Doe</option>
                <option value="2">Jane Smith</option>
                <!-- Populate dynamically from DB -->
            </select>

            <label for="teacherId">Teacher:</label>
            <select name="teacherId" id="teacherId" required>
                <option value="" disabled selected>Select teacher</option>
                <option value="101">Mrs. Adams</option>
                <option value="102">Mr. Lee</option>
                <!-- Populate dynamically from DB -->
            </select>

            <label for="classGroup">Class Group:</label>
            <input type="text" name="classGroup" id="classGroup" placeholder="e.g., Grade 1A" required>

            <button type="submit">Add Student</button>
        </form>
        <a class="back-link" href="a_dashboard.jsp">← Back to Dashboard</a>
    </div>

</body>
</html>
