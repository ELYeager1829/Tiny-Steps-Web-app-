<%-- 
    Document   : report
    Created on : 28 Apr 2025, 11:10:32
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report Page</title>
    </head>
    <body>
        <h1>Provide us with your child's details:</h1>
        <form action="OnboardingServlet.do" method="post">
            <table>
                <tr>
                    <td>id:</td>
                    <td><input type="text" name="id"></td>
                </tr>
                  <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name"></td>
                </tr>
                  <tr>
                    <td>Surname:</td>
                    <td><input type="text" name="surname"></td>
                </tr>
                  <tr>
                    <td></td>
                    <td><input type="submit" value="See Report"></td>
                    <td><input type="hidden" value="repo" name="op"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
