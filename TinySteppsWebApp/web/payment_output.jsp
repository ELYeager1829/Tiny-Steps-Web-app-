<%-- 
    Document   : payment_output
    Created on : 28 Apr 2025, 11:47:19
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment message Page</title>
    </head>
    <body>
       
            <%
                String msg=(String)request.getAttribute("message");
            %>
            <p style="color: green"><%=msg%></p>
        
    </body>
</html>
