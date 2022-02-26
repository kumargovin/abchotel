<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbpackages.DbConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%   String result="",resultclass=" error ";
     String  id, name="",age="",address="",aadhaarno="",comments="";
     boolean ispostback=(request.getParameter("check") == null)? false:true;
    if(!ispostback)
    {
    id=request.getParameter("id");
    PreparedStatement ps=DbConfig.connect().prepareStatement("select * from   guestentry where id=?");
    ps.setString(1, id);
    ResultSet rs=ps.executeQuery();
   
    if (rs.next())
    {
     
        name="" + rs.getObject("name");
        age="" + rs.getString("age");
        address="" + rs.getString("address");
        aadhaarno="" + rs.getObject("aadhaarno");
        comments="" + rs.getString("comments");
            }
            
    }
    else
    {
        String cmd=request.getParameter("cmd");
        name=request.getParameter("name");
        age=request.getParameter("age");
        address=request.getParameter("address");
        aadhaarno=request.getParameter("aadhaarno");
        comments=request.getParameter("comments");
        id=request.getParameter("id");
        if(cmd.equals("update"))
        {
            System.out.println("Write code for updating");
           PreparedStatement  ps = DbConfig.connect().prepareStatement("update guestentry set name=?, age=?, address=?,aadhaarno=?,comments=? where id=?"); 
           ps.setString(1, name);
           ps.setString(2, age);
           ps.setString(3, address);
           ps.setString(4,aadhaarno);
           ps.setString(5, comments);
           ps.setString(6, id);
           int n=ps.executeUpdate();
           System.out.println("Updated");
           if(n>0)
          {
              result="Updated Successfully ";
          }
          else 
          {
              result="Updated Not Successfully ";
          }
              out.println(id);
        }
       // --------------Delete starts here---------
                
                 if(cmd.equals("delete"))
        {
            System.out.println("Write code for deleting");
            
            PreparedStatement ps=DbConfig.connect().prepareStatement("delete from guestentry where id=?");
            
            ps.setString(1, id);
            int n=ps.executeUpdate();
            System.out.println("deleted");
            if(cmd.equals("delete"))
            {
                name=""; age=""; address="";aadhaarno="";comments="";
            }
            
             if(n>0)
          {
              result="Deleted Successfully " + n;
          }
          else 
          {
              result="Deleted Not Successfully";
          }
              out.println(id);
        }
           
        }
     
%>
<%@include file="includes/header.jsp" %>  
<title>Guest edit</title>
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
            <input type="hidden" name="id" value="<%=id%>">
            <h1><%=result%></h1>
                
       
        <!--Form End -->
        
        
        
                    <h2 class=""></h2>
                    <input type="hidden" name="check"> 
                     <div class="form-floating mb-3 mt-3">
                        <input  value="<%=name%>"  type="text" required class="form-control" id="guestname" placeholder="Guest Name" name="name">
                        <label for="guestname">Guest Name</label>
                        <div class="valid-feedback">Guest Name ok.</div>
                        <div class="invalid-feedback">Please fill out Guest Name.</div>
                    </div>
                          <div class="form-floating mt-3 mb-3">
                        <input required value="<%=age%>" type="number"required class="form-control" id="age" placeholder="Age" name="age">
                        <label for="age">Age</label>
                        <div class="valid-feedback">Age ok.</div>
                        <div class="invalid-feedback">Please fill out Age.</div>
                        
                    <div class="form-floating mt-3 mb-3">
                        <input required value="<%=address%>" type="text"required class="form-control" id="address" placeholder="Address" name="address">
                        <label for="address">Address</label>
                        <div class="valid-feedback">Address ok.</div>
                        <div class="invalid-feedback">Please fill out Address.</div>

                    </div> 
                        <div class="form-floating mt-3 mb-3">
                        <input required value="<%=aadhaarno%>" type="number" class="form-control" id="aadhaarno" placeholder="Aadhaar No" name="aadhaarno">
                        <label for="aadhaarno">Aadhar No</label>
                        <div class="valid-feedback">Aadhar No.</div>
                        <div class="invalid-feedback">Please fill out Aadhar No.</div>

                    </div> 
                        
                    <div class="form-floating mb-3 mt-3">
 <textarea required   class="form-control" id="comments" name="comments" placeholder="Comment goes here">
<%=comments%></textarea>
                        <label for="comments">Comments</label>
                        <div class="valid-feedback">Comments ok.</div>
                        <div class="invalid-feedback">Please fill out Comment.</div>

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
                     <!--************Body Ends ************--> 
                     
                      <!--************Footer Form Starts ************-->  
                      <%@include file="includes/footer.jsp" %>
                      <!--************Footer Form Ends ************-->
                      
        </body>
</html>
