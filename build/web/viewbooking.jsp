 <%@page import="dbpackages.DbConfig"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

 <!--************Header Form  Start************-->
 
<%@include file="includes/header.jsp" %>
<title>viewbooking </title>
</head>
<body>
           
    <div class="container-fluid">
        .                                                                                                                                 
        <div style="background-size: cover ;background-image: url('images/people.jpg')"  class="p-5 bg-primary text-white text-center">
            <h1 class="display-1">Hotel Star</h1>
            <p class="fw-bold">A hotel is just a place to lay your head.
                !</p> 
        </div>
    </div>
          <!--************Header Form Ends ************-->
    
         <!--************Menu Starts ************-->
            <%@include file="includes/menu.jsp" %>
 
          <!--************Menu Ends ************-->
 
         <!--************body Starts ************-->
         
    <div class="container mt-3">
  <h2>Room Category </h2>
  <p>Room arrangement:</p>
  <table class="table">
    <thead class="table-dark">
      <tr>
        <th>Category No</th>
        <th>Category Name</th>
        <th>Description</th>
        <th>Room Charge</th>
      </tr>
    </thead>
    <tbody>
        <% 
        PreparedStatement ps=DbConfig.connect().prepareStatement("select * from roomcategories order by categorynumber");
    ResultSet rs=ps.executeQuery(); 
while(rs.next())
{
        %>
      <tr>
        <td><%=rs.getObject("categorynumber")%></td>
        <td><%=rs.getObject("categoryname")%></td>
        <td><%=rs.getObject("description")%></td>
        <td><%=rs.getObject("roomcharge")%></td>
      </tr>
      <%
          }
      
      %>
     
      
    </tbody>
  </table>
    </div>
      
     <%@include file="includes/footer.jsp" %>
</body>
</html>