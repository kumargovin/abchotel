<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbpackages.DbConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%   
    boolean ispostback=(request.getParameter("check") == null)? false:true;
    System.out.println(ispostback);
  String comments="", guestname = "", age = "", address = "", aadhaarno = "",resultclass=" error ",result="";
    if (ispostback) {
        try {
            String cmd=request.getParameter("cmd");
            System.out.println(cmd);
            if(cmd.equals("submit"))
            {
 
           guestname = request.getParameter("guestname");
           age = request.getParameter("age");
            address = request.getParameter("address");
            comments = request.getParameter("comments");
            aadhaarno = request.getParameter("aadhaarno");
            Connection connection = DbConfig.connect();
            PreparedStatement ps = connection.prepareStatement("insert into guestentry values(?,?,?,?,?,roomcategoryseq.nextval)") ; 


            ps.setString(1, guestname);
            ps.setString(2, age);
            ps.setString(3, address);
            ps.setString(4,aadhaarno);
            ps.setString(5,comments);
            ps.executeUpdate();
            result = "Successfully";
            resultclass=" successfully ";
            
            }    
            
            if(cmd.equals("clear"))
            {
                comments=""; guestname = ""; age = ""; address = ""; aadhaarno = "";
            }
            
            
            
        } catch (Exception ex) {
            result = ex.getMessage();
            System.out.println(ex);
        }
    }
    
        
%>
<%@include file="includes/header.jsp" %>  
<title>Guest Entry</title>
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
                
       
        <!--Form End -->
        
        
        
                    <h2 class=""></h2>
                    <input type="hidden" name="check"> 
                     <div class="form-floating mb-3 mt-3">
                        <input  value="<%=guestname%>"  type="text" required class="form-control" id="guestname" placeholder="Guest Name" name="guestname">
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
                        <label for="aadhaarno">Aaddhaar No</label>
                        <div class="valid-feedback">Aaddhaar No.</div>
                        <div class="invalid-feedback">Please fill out Aaddhaar No.</div>

                    </div> 
                        
                    <div class="form-floating mb-3 mt-3">
                        <textarea required  class="form-control" id="comment" name="comments" placeholder="Comment goes here"><%=comments%></textarea>
                        <label for="comment">Comments</label>
                        <div class="valid-feedback">Comments ok.</div>
                        <div class="invalid-feedback">Please fill out Comment.</div>

                        </div>
                        <div class="row">
                            <div class="col-sm-6 banner"
                        <div class="form-floating mb-3 mt-3">
                        <div class="d-grid">
                            <button type="submit" name="cmd" value="submit" class="btn-block btn btn-primary">Submit</button></div>
                        </div>
                                 <div class="col-sm-6 banner" 
                                     <div class="form-floating mb-3 mt-3">
                                         
                        <div class="d-grid">
                            <button type="submit" formnovalidate name="cmd" value="clear" class="btn-block btn btn-primary">Clear</button></div>
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
