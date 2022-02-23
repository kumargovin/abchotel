<%@page import="utilitiespackage.Utilities"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbpackages.DbConfig"%>
<%@page import="java.sql.Connection"%>
<%
    boolean ispostback = (request.getParameter("check") == null) ? false : true;
    
    String  roomno= "",  roomcharge = "", roomcategory = "", result = "",resultclass=" error ";
    if (ispostback) {
        try {
            roomno = request.getParameter("roomno");
            roomcharge = request.getParameter("roomcharge");
            roomcategory = request.getParameter("roomcategory");
            Connection connection = DbConfig.connect();
            PreparedStatement ps = connection.prepareStatement("insert into rooms values(roomcategoryseq.nextval,?,?,?)");
            ps.setString(1,roomno );
            ps.setString(2, roomcharge);
            ps.setString(3, roomcategory);
            ps.executeUpdate();
            result = "Success";
            resultclass=" success ";
        } catch (Exception ex) {
            result = ex.getMessage();
        }
    }
%>
<!--************Header Starts ************-->
<%@include file="includes/header.jsp" %>
<title>admin_booking </title>
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
             <div class="col-sm-3 banner padding"></div>
         
        
            <div class="col-sm-6 banner padding"> 
                
                <!-- The Form -->
                <form method="post" class="was-validated">
                   <% out.println( Utilities.getModal("admin_booking",result,""));%>
                    <h2 class="<%=resultclass%>"><%=result%></h2>
                    <input type="hidden" name="check"> 
                    <div class="form-floating mb-3 mt-3">
                        <input value="<%=roomno%>" type="text" required class="form-control" id="roomno" placeholder="Enter Room No" name="roomno">
                        <label for="roomno">Room No</label>
                        <div class="valid-feedback">Room No ok.</div>
                        <div class="invalid-feedback">Please fill out Room No.</div>
                    </div>

                    <div class="form-floating mt-3 mb-3">
                        <input required value="<%=roomcharge%>" type="number" class="form-control" id="roomcharge" placeholder="Room Charge" name="roomcharge">
                        <label for="roomcharge">Room Charge</label>
                        <div class="valid-feedback">Room Charge ok.</div>
                        <div class="invalid-feedback">Please fill out Room Charge.</div>

                    </div> 
                        
                        <div class="form-floating mt-3 mb-3">
                          <% 
        out.println(Utilities.getCategoriesList());
        %>
                        <label for="categorynumber">Room Category</label>
                        <div class="valid-feedback">Room Category ok.</div>
                        <div class="invalid-feedback">Please fill out Room Category.</div>

                    </div>

                    
                    <div class="form-floating mb-3 mt-3">
                        <div class="d-grid">
                            <button type="submit" class="btn-block btn btn-primary">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
             <div class="row">
             <div class="col-sm-3 banner padding"></div>
         </div>  
         </div>
        </div>                
          <!--************Body Ends ************-->              
    
                        
    </div>

                        
            <!--************Footer Starts ************-->            
    <%@include file="includes/footer.jsp" %>
            <!--************Footer Ends ************-->
    
</body>
</html>
