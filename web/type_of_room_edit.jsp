<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbpackages.DbConfig"%>
<%@page import="java.sql.Connection"%>
<%
     String result="",resultclass=" error ";
     String   categoryname="",description="",roomcharge="",categoryno="",categorynumber;
     boolean ispostback=(request.getParameter("check") == null)? false:true;
    if(!ispostback)
    { 
        
    categoryno=request.getParameter("categoryno");
    PreparedStatement ps=DbConfig.connect().prepareStatement("select * from   roomcategories where categorynumber=?");
    ps.setString(1, categoryno);
    ResultSet rs=ps.executeQuery();
   
    if (rs.next())
    {
     
        categoryname="" + rs.getObject("categoryname");
        description="" + rs.getString("description");
        roomcharge="" + rs.getString("roomcharge");
        
            }
            
    }
    else 
    {
        String cmd=request.getParameter("cmd");
        categoryname=request.getParameter("categoryname");
        description=request.getParameter("description");
        roomcharge=request.getParameter("roomcharge");
        categorynumber=request.getParameter("categorynumber");
        if(cmd.equals("update"))
        {
           PreparedStatement ps=DbConfig.connect().prepareStatement("update roomcategories set from categoryname=?,description=?,roomcharge=?,where categorynumber=?");
           ps.setString(1, categoryname);
           ps.setString(2, description);
           ps.setString(3, roomcharge);
           ps.setString(4, categorynumber);
           int n=ps.executeUpdate();
              if(n>0)
              {
                 result="Updated Successfully";
                  
              }
              else
              {
                  result="Updated Not Successfully";
              }
              out.println(categorynumber);
        }
        if(cmd.equals("delete"))
        {
        PreparedStatement ps=DbConfig.connect().prepareStatement("delete from roomcategories where categorynumber");
        ps.setString(1, categorynumber);
        int n=ps.executeUpdate();
        if(n>0)
        {
         result="Deleted Successfully";   
        }
        else
        {
            result="Deleted Not Successfully";
        }
        out.println(categorynumber);
    }
    }
%>

<%@include file="includes/header.jsp" %>  
<title>Type of rooms_edit</title>
</head>
<body>
             <!--************Header Form  Start************-->
             
    <div class="container-fluid">
        .                                                                                                                                 
        <div style="background-size: cover ;background-image: url('images/people.jpg')"  class="p-5 bg-primary text-white text-center">
            <h1 class="display-1">Hotel Star</h1>
            <p class="fw-bold">A hotel is just a place to lay your head.
                !</p> 
        </div>
    </div>
        
          <!--************Header Form Ends ************-->

           <!--************Menu Form Starts ************-->
        <%@include file="includes/menu.jsp" %>  
        
        <!--************Menu Form Ends ************-->
        
        
        <!--************Body Starts ************-->
        
          <div class="container-fluid">
  <div class="row">
    <div class="col-sm-3 banner"></div>
    
    
    <div class="col-sm-6 banner" style="background-color:lavenderblush;">
        
        <!--Form Start-->
        <form method="post">
            <input type="hidden" name="check">
            <h1><%=result%></h1>
         
        <!--Form End -->
        
                    <h2 class=""></h2>
                    <input type="hidden" name="check"> 
                     <div class="form-floating mb-3 mt-3">
                        <input  value="<%=categoryname%>"  type="text" required class="form-control" id="categoryname" placeholder="Category Name" name="categoryname">
                        <label for="categoryname">Category Name</label>
                        <div class="valid-feedback">Category Name OK.</div>
                        <div class="invalid-feedback">Please fill out Category Name.</div>
                     </div>
                        <div class="form-floating mb-3 mt-3">
                            <input type="text" required   class="form-control" id="description" name="description" placeholder="Description goes here" value="<%=description%>">
                        <label for="description">Description</label>
                        <div class="valid-feedback">Description OK.</div>
                        <div class="invalid-feedback">Please fill out Description.</div>
                        </div>
                  
                    <div class="form-floating mt-3 mb-3">
                        <input required value="<%=roomcharge%>" type="text"required class="form-control" id="roomcharge" placeholder="Room Charge" name="roomcharge">
                        <label for="roomcharge">Charge</label>
                        <div class="valid-feedback">Room Charge ok.</div>
                        <div class="invalid-feedback">Please fill out Room Charge.</div>

                       </div>
                        
                       
                        <div class="row">
                            <div class="col-sm-6 banner">
                        <div class="form-floating mb-3 mt-3">
                        <div class="d-grid">
                            <button type="submit" name="cmd" value="update" class="btn-block btn btn-primary">Update</button></div>
                        </div>
                          </div> 
                            <div class="col-sm-6 banner">
                        <div class="form-floating mb-3 mt-3">
                        <div class="d-grid">
                            <button type="delete" name="cmd" value="delete" class="btn-block btn btn-primary">Delete</button></div>
                        </div>
                        </div>
                           
                                  </form>
                      <div class="col-sm-3 banner"></div>               
                 </div>
            </div>     
      </div> 
                        
          </div>             <!--************Body Ends ************--> 
                     
                      <!--************Footer Form Starts ************-->  
                      <%@include file="includes/footer.jsp" %>
                      <!--************Footer Form Ends ************-->
              
                      
        </body>
</html>
