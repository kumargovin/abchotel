<%@page  import="java.sql.ResultSet"%>
<%@page import="dbpackages.DbConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%
  String result="";
  boolean ispostback=(request.getParameter("check")==null) ? false:true;
  String roomno="0";
  String roomcategory="",roomcharge="";
  if(ispostback)
  {
      try
          {
             String cmd=request.getParameter("cmd");
             System.out.println("cmd");
             
             //***********Get starts********************
             if(cmd.equals("get"))
             {
                 roomno=request.getParameter("roomno");
                 Connection connection=DbConfig.connect(); 
                 PreparedStatement ps= connection.prepareStatement("select * from rooms where roomno=?");
                 
                 ps.setString(1, roomno);
                 ResultSet rs=ps.executeQuery();
                 
                 if(rs.next())
                 {
                    roomcategory="" + rs.getObject("roomcategory");
                    roomcharge="" + rs.getObject("roomcharge");
                    result="Record Found";  
                 }
                 else
                 {
                     result="Record Not Found";
                     roomcategory="Not Found";
                 }  
             }
             //**************Get Ends************** 
             
             //**************Update starts************
             
             if(cmd.equals("submit"))
        {
             Connection connection=DbConfig.connect();
             roomno = request.getParameter("roomno");
            roomcategory = request.getParameter("roomcategory");
            roomcharge = request.getParameter("roomcharge");
            PreparedStatement ps = connection.prepareStatement("update rooms set= roomcategory=?, roomcharge=? where roomno=?");
            ps.setString(1, roomno);
            ps.setString(2, roomcategory);
            ps.setString(3, roomcharge);
          int n=  ps.executeUpdate();
           if(n>0)
          {
              result="Record Update " + n;
          }
          else 
          {
              result="Record Not Update";
          }
              out.println(roomno);
          
          // ***********UPDATE Ends here*****************
        }
        //**************Delete starts here*********************
        if(cmd.equals("delete"))
        {
            Connection connection=DbConfig.connect();
             roomno = request.getParameter("roomno");  
             roomcategory =request.getParameter("roomcategory");
            roomcharge = request.getParameter("roomcharge");
            
            PreparedStatement ps = connection.prepareStatement("delete from rooms where roomno=?");
            ps.setString(1, roomno);
          int n =  ps.executeUpdate();
        
            
          if(n>0)
          {
              result="Record Deleted " + n;
          }
          else 
          {
              result="Record Not Deleted";
          }
              out.println(roomno);
        } 
        //**************Delete ends here*********************
        }
        catch(Exception ex)
        {
            System.out.println(ex);
            result=ex.getMessage();
        }
   }
               //**********************************************************  
    
%>
<!--************* Header starts***********-->
<%@include file="includes/header.jsp" %>

<%@include file="includes/header.jsp" %>
<title>admin_update_rooms </title>
</head>
<body>

    <div class="container-fluid">
                                                                                                                                         
        <div style="background-size: cover ;background-image: url('images/people.jpg')"  class="p-5 bg-primary text-white text-center">
            <h1 class="display-1">Hotel Star</h1>
            <p class="fw-bold">A hotel is just a place to lay your head.
                !</p> 
        </div>
        <!--************Header Ends ************-->

           <!--************Menu Starts ************-->
            <%@include file="includes/menu.jsp" %>
        
        <!--************Menu Ends ************-->

        <!--************Body Starts ************-->
          <div class="container-fluid">
  <div class="row">
    <div class="col-sm-3 banner"></div>
    
    
    <div class="col-sm-6 banner" style="background-color:lavenderblush;">
        
        <!--Form Start-->
        <form method="post">
            <h1><%=result%></h1>
                
        <div class="row">
            <div class="col-sm-8 banner">
                <div class="form-floating mb-3 mt-3">
                        <input value="<%=roomno%>" type="number" required class="form-control" id="roomno" placeholder="Enter Room No" name="roomno">
                        <label for="roomno">Room No</label>
                        <div class="valid-feedback">Room No ok.</div>
                        <div class="invalid-feedback">Please fill out Room No.</div>
                    </div>
            
            </div>       
            <div class="col-sm-4 banner"><br>
                <button type="submit" name="cmd" formnovalidate="formnovalidate" value="get" class="btn-block btn btn-primary">Get</button>
                
            </div>
        
        </div>
      
        <!--Form End -->
        
                    <h2 class=""></h2>
                    <input type="hidden" name="check"> 
                    <div class="form-floating mb-3 mt-3">
                        <input  value="<%=roomcategory%>"  type="text" required class="form-control" id="roomcategory" placeholder="Enter RoomCategory" name="roomcategory">
                        <label for="roomcategory">Room Category</label>
                        <div class="valid-feedback">Room Category ok.</div>
                        <div class="invalid-feedback">Please fill out Room Category.</div>
                    </div>

                    <div class="form-floating mt-3 mb-3">
                        <input required value="<%=roomcharge%>" type="number" class="form-control" id="roomcharge" placeholder="Room Charge" name="roomcharge">
                        <label for="roomcharge">Room Charge</label>
                        <div class="valid-feedback">Room Charge ok.</div>
                        <div class="invalid-feedback">Please fill out Room Charge.</div>

                    </div> 
                        
                        <div class="row">
                            <div class="col-sm-6 banner"
                        <div class="form-floating mb-3 mt-3">
                        <div class="d-grid">
                            <button type="submit" name="cmd" value="submit" class="btn-block btn btn-primary">Update</button></div>
                        </div>
                                 <div class="col-sm-6 banner" 
                                     <div class="form-floating mb-3 mt-3">
                        <div class="d-grid">
                            <button type="submit" name="cmd" value="delete" class="btn-block btn btn-primary">Delete</button></div>
                        </div>         
    
                          </div> 
                                 </form>
                      <div class="col-sm-3 banner"></div>               
                 </div>
            </div>     
      </div> 
                     <!--************Body Ends ************--> 
                   
                      <!--************Footer Form Starts ************-->  
                      <%@include file="includes/footer.jsp" %>
                      <!--************Footer Form Ends ************-->
                      
    </body>
</html>

      