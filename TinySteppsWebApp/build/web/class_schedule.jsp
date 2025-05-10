<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
         <title>Tiny Steps |Class schedule</title>

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
    </head>
    <body>

        <h2>Class Curriculum Schedule</h2>

        <table>
            <tr>
                <th>Day</th>
                <th>08:00 - 09:00</th>
                <th>09:00 - 10:00</th>
                <th>10:00 - 11:00</th>
                <th>11:00 - 12:00</th>
                <th>Lunch</th>
                <th>13:00 - 14:00</th>
                <th>14:00 - 15:00</th>
            </tr>
            <tr>
                <td>Monday</td>
                <td>Math</td>
                <td>English</td>
                <td>Life Skills</td>
                <td>Creative Arts</td>
                <td>12:00 - 13:00</td>
                <td>Reading</td>
                <td>Play Time</td>
            </tr>
            <tr>
                <td>Tuesday</td>
                <td>Science</td>
                <td>Math</td>
                <td>Music</td>
                <td>Storytelling</td>
                <td>12:00 - 13:00</td>
                <td>Outdoor Activity</td>
                <td>Drawing</td>
            </tr>
            <tr>
                <td>Wednesday</td>
                <td>Reading</td>
                <td>Math</td>
                <td>Physical Ed</td>
                <td>English</td>
                <td>12:00 - 13:00</td>
                <td>Science</td>
                <td>Music</td>
            </tr>
            <tr>
                <td>Thursday</td>
                <td>Math</td>
                <td>English</td>
                <td>Computer Skills</td>
                <td>Arts & Crafts</td>
                <td>12:00 - 13:00</td>
                <td>Science Games</td>
                <td>Free Play</td>
            </tr>
            <tr>
                <td>Friday</td>
                <td>Review</td>
                <td>Quiz Time</td>
                <td>Drama</td>
                <td>Cleanup & Story</td>
                <td>12:00 - 13:00</td>
                <td>Reflection


                    </body>