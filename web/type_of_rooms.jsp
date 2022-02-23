<%@page  import="java.sql.ResultSet"%>
<%@page import="dbpackages.DbConfig"%>
<%@include file="includes/header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Type of rooms</title>
    </head>
    <body>
        <h1>Type of rooms</h1>
        <div class="container-fluid">
        <div style="background-size: cover; background-image:url('images/people.jpg')" class="p-5 bg-primary text-white text-center">
            <h1 class="display-1">Hotel Star</h1> 
            <p class="fw-bold"> A hotel is just a place to lay your head.
            !</p>
        </div>
    </div>
        <!--**************** Header ends ******************-->
    
        <!--**************** Menu Starts ******************-->
        <%@include file="includes/menu.jsp" %>
        <!--**************** Menu Ends ******************-->
    
        <div>
            <table class="table table-dark table-striped">
                <tr>
                          <td>View Rooms</td>
                          <td>Category Name</td>
                          <td>Comments</td>
                          <td>Charges</td>
                      </tr>
            <%
                try
            {
                  ResultSet rs=  DbConfig.connect().prepareStatement("select * from roomcategories order by categoryname").executeQuery();
                  while (rs.next()) {                          
                          %>
                          <tr>
                               <td><a target="roomsview" href="admin_view_rooms.jsp?categoryno=<%=rs.getObject(1)%>">View Rooms</a></td>
                          <td><%=rs.getObject(2)%></td>
                          <td><%=rs.getObject(3)%></td>
                          <td><%=rs.getObject(4)%></td>
                      </tr>
                          <%
                      }
            }
            catch(Exception ex)
            {
                System.out.println(ex);
            }
            %>
            
            </table>
            
        </div>
        
        
        
        
        <!-- *********Footer Starts ***********-->
        <%@include file="includes/footer.jsp" %>
        <!-- *********Footer Ends ***********-->

    </body>
</html>
