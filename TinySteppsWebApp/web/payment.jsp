<%-- 
    Document   : payment
    Created on : 28 Apr 2025, 10:55:39
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Page</title>
    </head>
    <body>
        <h1>Make Payment</h1>
        <form action="OnboardingServlet.do" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>What month are you paying for: </td>
                    <td><input type="number" name="month" min="1" max="12"></td>
                </tr>
                <tr>
                    <td>Provide proof of payment: </td>
                    <td><input type="file" name="pay"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Submit Payment"></td>
                    <td><input type="hidden" value="pay" name="op"></td>
                </tr>
            </table>
        </form>

    </body>
</html>
