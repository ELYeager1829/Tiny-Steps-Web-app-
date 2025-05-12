<%-- 
    Document   : manage_communication
    Created on : May 1, 2025, 11:45:25 AM
    Author     : olwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entities.Announcement"%>
<%@page import="za.ac.tut.ejb.bl.AnnouncementFacadeLocal"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Announcements & Communication</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Nunito', sans-serif;
            background-color: #f9f9f9;
            padding: 2rem;
        }

        h1 {
            text-align: center;
            color: #87CEFA;
        }

        .announcement-form, .announcement-list {
            max-width: 800px;
            margin: 2rem auto;
            background: #ffffff;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        form input, form textarea, form button {
            width: 100%;
            margin-top: 1rem;
            padding: 0.8rem;
            font-size: 1rem;
            border-radius: 10px;
            border: 1px solid #ccc;
        }

        form button {
            background-color: #87CEFA;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
            border: none;
            transition: background-color 0.3s ease;
        }

        form button:hover {
            background-color: #00BFFF;
        }

        .announcement {
            border-bottom: 1px solid #eee;
            padding: 1rem 0;
        }

        .announcement h3 {
            margin: 0;
            color: #333;
        }

        .announcement p {
            margin: 0.5rem 0;
        }

        .announcement small {
            color: #888;
        }
    </style>
</head>
<body>

    <h1>Announcements & Communication</h1>

    <!-- Form to post a new announcement -->
    <div class="announcement-form">
        <h2>Post New Announcement</h2>
        <form action="AdminServlet.do" method="post">
            <input type="text" name="title" placeholder="Title" required />
            <textarea name="message" rows="5" placeholder="Write your announcement here..." required></textarea>
            <button type="submit">Post Announcement</button>
        </form>
    </div>

    <!-- Display list of announcements -->
    <div class="announcement-list">
        <h2>Recent Announcements</h2>
        <%
            List<Announcement> announcements = (List<Announcement>)request.getAttribute("announcements");
            for(Announcement ann : announcements) {
        %>
            <div class="announcement">
                <h3><%= ann.getTitle() %></h3>
                <p><%= ann.getBody() %></p>
                <small>Posted on: <%= ann.getPostedAt() %></small>
            </div>
        <% } %>
    </div>

</body>
</html>
