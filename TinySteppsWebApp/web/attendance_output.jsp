<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance Submitted</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef7ff;
            padding: 2rem;
        }

        h2 {
            color: #2c3e50;
        }

        table {
            width: 50%;
            margin-top: 1rem;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 0.75rem;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #dff0d8;
        }

        .message {
            color: #e74c3c;
            font-weight: bold;
        }

        a {
            display: inline-block;
            margin-top: 1rem;
            text-decoration: none;
            background-color: #3498db;
            color: #fff;
            padding: 10px 15px;
            border-radius: 5px;
        }

        a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<h2>Attendance Submitted</h2>

<%
    String[] present = request.getParameterValues("present");

    if (present == null || present.length == 0) {
%>
    <p class="message">No students were marked as present.</p>
<%
    } else {
%>
    <p>Total Present: <strong><%= present.length %></strong></p>
    <table>
        <tr>
            <th>Student Number</th>
        </tr>
        <%
            for (int i = 0; i < present.length; i++) {
        %>
        <tr>
            <td><%= present[i] %></td>
        </tr>
        <%
            }
        %>
    </table>
<%
    }
%>

<a href="attendance.jsp">Back to Attendance</a>

</body>
</html>
