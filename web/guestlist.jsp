

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.concurrent.ExecutionException"%>
<%@page import="dbpackages.DbConfig"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--***********Header starts here************ -->
<%@include file="includes/header.jsp" %>
<title>Guest List!</title>
</head>
<body>
    
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
    
        <!--***************Body starts Here ***************-->
        <div class=" container mt-3"> 
            <h2>Guest List </h2>
            <p class="fw-bold">Guest booking :</p>
            <!--<p>Room list </p>--> 
            <table class="table">
    <thead class="table-dark">
                <tr>
                    <td>Guest name</td>
                    <td>Age</td>
                    <td>Address</td>
                    <td>Aadhaar No</td>
                    <td>Comment</td>
                    <td>Action</td>
                </tr>
                </thead>
                 <tbody>
                <%
                try
                {
                    ResultSet rs=DbConfig.connect().prepareStatement("select * from guestentry").executeQuery();
                    while(rs.next())
                    {
                              
                %>
                <tr>
                          <td><%=rs.getObject(1)%></td>
                          <td><%=rs.getObject(2)%></td>
                          <td><%=rs.getObject(3)%></td>
                          <td><%=rs.getObject(4)%></td>
                          <td><%=rs.getObject(5)%></td>
                          <td><a target="roomsview" href="editguest.jsp?id=<%=rs.getObject(6)%>">edit</a></td>
                          
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
                <!--***************Body Ends ***************--%>
    
        <!-- *********Footer Starts ***********-->
        <%@include file="includes/footer.jsp" %>
        
        <!-- *********Footer Ends ***********-->
    </body>
</html>
