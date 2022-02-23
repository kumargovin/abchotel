<%@page import="dbpackages.DbConfig"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>

<!--***********Header starts here************ -->
<%@include file="includes/header.jsp" %>
<title>Admin_View_Rooms</title>
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
            <h2>Room Description </h2>
            <p class="fw-bold">Rooms_List :</p>
            <!--<p>Room list </p>--> 
            <table class="table">
    <thead class="table-dark">
      <tr>
        <th>Room_Id</th>
        <th>Room_No</th>
        <th>Room_Charge</th>
        <th>Room_Category</th>
      </tr>
    </thead>
    <tbody>
        <%
            String categoryno=request.getParameter("categoryno");
          PreparedStatement ps=DbConfig.connect().prepareStatement("select * from rooms where roomcategory=? order by roomno asc");
          ps.setString(1, categoryno);
          ResultSet rs= ps.executeQuery();
          while(rs.next())
             {
        %>
        <tr>
            <td><%=rs.getObject("roomid")%></td>
            <td><%=rs.getObject("roomno")%></td>
            <td><%=rs.getObject("roomcharge")%></td>
            
            
        </tr>
        <%
             }
        %>
        
          </tbody>
            </table>
             </div>

        <!--***************Body Ends ***************--%>
    
        <!-- *********Footer Starts ***********-->
        <%@include file="includes/footer.jsp" %>
        
        <!-- *********Footer Ends ***********-->
</body>
</html>