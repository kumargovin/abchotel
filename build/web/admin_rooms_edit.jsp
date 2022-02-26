<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbpackages.DbConfig"%>
<%@page import="java.sql.Connection"%>
<% 
     String result="",resultclass=" error ";
     String   roomno="",roomcharge="",roomcategory="",roomid="";
     boolean ispostback=(request.getParameter("check") == null)? false:true;
    if(!ispostback)
    { 
        
    roomno=request.getParameter("roomno");
    PreparedStatement ps=DbConfig.connect().prepareStatement("select * from   rooms where roomid=?");
    ps.setString(1, roomid);
    ResultSet rs=ps.executeQuery();
   
    if (rs.next())
    {
     
        roomno="" + rs.getObject("roomno");
        roomcharge="" + rs.getString("roomcharge");
        roomcategory="" + rs.getString("roomcategory");
        
            }
            
    }
    else 
    {
        String cmd=request.getParameter("cmd");
       roomno=request.getParameter("roomno");
        roomcharge=request.getParameter("roomcharge");
        roomcategory=request.getParameter("roomcategory");
        if(cmd.equals("update"))
        {
           PreparedStatement ps=DbConfig.connect().prepareStatement("update rooms set from roomno=?,roomcharge=?,roomcategory,where roomid=?");
           ps.setString(1,roomno);
           ps.setString(2, roomcharge);
           ps.setString(3, roomcategory);
           ps.setString(4, roomid);
           int n=ps.executeUpdate();
              if(n>0)
              {
                 result="Updated Successfully";
                  
              }
              else
              {
                  result="Updated Not Successfully";
              }
              out.println(roomid);
        }
        if(cmd.equals("delete"))
        {
        PreparedStatement ps=DbConfig.connect().prepareStatement("delete from rooms where roomid");
        ps.setString(1, roomid);
        int n=ps.executeUpdate();
        if(n>0)
        {
         result="Deleted Successfully";   
        }
        else
        {
            result="Deleted Not Successfully";
        }
        out.println(roomid);
    }
    }


%>

<%@include file="includes/header.jsp" %>
<title> Admin_Room_Edit </title>
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
                        <input  value="<%=roomno%>"  type="text" required class="form-control" id="roomno" placeholder="Room No" name="roomno">
                        <label for="roomno">Room No</label>
                        <div class="valid-feedback">Room No OK.</div>
                        <div class="invalid-feedback">Please fill out Room No.</div>
                     </div>
                       
                    <div class="form-floating mt-3 mb-3">
                        <input required value="<%=roomcharge%>" type="text"required class="form-control" id="roomcharge" placeholder="Room Charge" name="roomcharge">
                        <label for="roomcharge">Room Charge</label>
                        <div class="valid-feedback">Room Charge OK.</div>
                        <div class="invalid-feedback">Please fill out Room Charge.</div>

                       </div>
                        <div class="form-floating mt-3 mb-3">
                        <input required value="<%=roomcategory%>" type="text"required class="form-control" id="roomcategory" placeholder="Room Category" name="roomcategory">
                        <label for="roomcategory">Room Category</label>
                        <div class="valid-feedback">Room Category OK.</div>
                        <div class="invalid-feedback">Please fill out Room Category.</div>
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
