<%@page  import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbpackages.DbConfig"%>
<%@page import="java.sql.Connection"%>
<%
    String result="";
    boolean ispostback = (request.getParameter("check") == null) ? false : true;
    String categoryno="0";
    String categoryname="",description="",roomcharge="" ;
    if(ispostback)
    {
        //****************Get Starts Here***************************
        try
        {
        String cmd=request.getParameter("cmd");
        System.out.println(cmd);
        if(cmd.equals("get"))
        {
   categoryno=request.getParameter("categoryno");
   Connection connection=DbConfig.connect();
   PreparedStatement ps= connection.prepareStatement("select * from roomcategories where categorynumber=?");
   
      
   ps.setString(1, categoryno);
   ResultSet rs=ps.executeQuery();
   if(rs.next())
   {
       categoryname="" + rs.getObject("categoryname");
       description="" + rs.getObject("description");
       roomcharge="" + rs.getObject("roomcharge");
       result="Record Found";
   }
   else 
   {
       result="Record Not Found";
   categoryname="Not found";
   }
   //****************Get Ends Here***************************
        }  
        // ***********UPDATE Starts here*****************
        if(cmd.equals("submit"))
        {
             Connection connection=DbConfig.connect();
             categoryname = request.getParameter("categoryname");
            description = request.getParameter("description");
            roomcharge = request.getParameter("roomcharge");
            categoryno =request.getParameter("categoryno");
            PreparedStatement ps = connection.prepareStatement("update roomcategories set categoryname=?, description=?, roomcharge=? where categorynumber=?");
            ps.setString(1, categoryname);
            ps.setString(2, description);
            ps.setString(3, roomcharge);
            ps.setString(4, categoryno);
          int n=  ps.executeUpdate();
           if(n>0)
          {
              result="Record Update " + n;
          }
          else 
          {
              result="Record Not Update";
          }
              out.println(categoryno);
          
          // ***********UPDATE Ends here*****************
        }
        //**************Delete starts here*********************
        if(cmd.equals("delete"))
        {
            Connection connection=DbConfig.connect();
             categoryname = request.getParameter("categoryname");
            description = request.getParameter("description");
            roomcharge = request.getParameter("roomcharge");
            categoryno =request.getParameter("categoryno");
            PreparedStatement ps = connection.prepareStatement("delete from roomcategories where categorynumber=?");
            ps.setString(1, categoryno);
          int n =  ps.executeUpdate();
        
            
          if(n>0)
          {
              result="Record Deleted " + n;
          }
          else 
          {
              result="Record Not Deleted";
          }
              out.println(categoryno);
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

  <%@include file="includes/header.jsp" %>
<title>Update </title>
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
            <h1><%=result%></h1>
                
        <div class="row">
            <div class="col-sm-8 banner">
                <div class="form-floating mb-3 mt-3">
                        <input value="<%=categoryno%>" type="number" required class="form-control" id="categoryno" placeholder="Enter Category No" name="categoryno">
                        <label for="categoryno">Category No</label>
                        <div class="valid-feedback">Category Name ok.</div>
                        <div class="invalid-feedback">Please fill out Category Name.</div>
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
                        <input  value="<%=categoryname%>"  type="text" required class="form-control" id="categoryname" placeholder="Enter Category" name="categoryname">
                        <label for="categoryname">Category Name</label>
                        <div class="valid-feedback">Category Name ok.</div>
                        <div class="invalid-feedback">Please fill out Category Name.</div>
                    </div>

                    <div class="form-floating mt-3 mb-3">
                        <input required value="<%=roomcharge%>" type="number" class="form-control" id="roomcharge" placeholder="Room Charge" name="roomcharge">
                        <label for="roomcharge">Room Charge</label>
                        <div class="valid-feedback">Room Charge ok.</div>
                        <div class="invalid-feedback">Please fill out Room Charge.</div>

                    </div> 

                    <div class="form-floating mb-3 mt-3">
                        <textarea required  class="form-control" id="comment" name="description" placeholder="Comment goes here">
                            <%=description%>
                        </textarea>
                        <label for="comment">Comments</label>
                        <div class="valid-feedback">Comments ok.</div>
                        <div class="invalid-feedback">Please fill out Comment.</div>

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
