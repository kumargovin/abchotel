<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="utilitiespackage.Utilities"%>
<%@page import="dbpackages.DbConfig"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            Connection connection=DbConfig.connect();
          PreparedStatement ps=  connection.prepareStatement("select * from roomcategories order by categoryname asc");
            ResultSet rs=ps.executeQuery();
            
        %>
        <select>
            <%
            while(rs.next())
            {
                String categoryname="" + rs.getObject("CATEGORYNAME");
                String categoryno="" + rs.getObject("CATEGORYNUMBER");
            %>
            <option value="<%=categoryno%>"><%=categoryname%></option>
            <%
            }
            %>
        </select>
        
        <% 
        out.println(Utilities.getCategoriesList());
        %>
    </body>
</html>
