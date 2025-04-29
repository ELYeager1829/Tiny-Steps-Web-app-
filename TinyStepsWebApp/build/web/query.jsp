<%-- 
    Document   : query
    Created on : 28 Apr 2025, 10:48:34
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Queries Page</title>
    </head>
    <body>
        <h1>Hey Parent, Make Queries here :)</h1>
        <form action="OnboardingServlet.do" method="post">
            <table>
                <tr>
                    <td>Enter query</td>
                    <td><textarea></textarea></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Submit Query"></td>
                    <td><input type="hidden" value="query" name="op"></td>
                </tr>
                
            </table>
        </form>
    </body>
</html>
