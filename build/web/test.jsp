<%-- 
    Document   : test
    Created on : Feb 7, 2022, 11:20:02 AM
    Author     : GOVIND
--%>

<%@page import="dbpackages.DbConfig"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
       out.println( DbConfig.connect());
        %>
    </body>
</html>
