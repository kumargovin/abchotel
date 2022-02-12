<%@page import="utilitiespackage.Utilities"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbpackages.DbConfig"%>
<%@page import="java.sql.Connection"%>
<%
    boolean ispostback = (request.getParameter("check") == null) ? false : true;
    
    String categoryname = "", description = "", roomcharge = "", result = "",resultclass=" error ";
    if (ispostback) {
        try {
            categoryname = request.getParameter("categoryname");
            description = request.getParameter("description");
            roomcharge = request.getParameter("roomcharge");
            Connection connection = DbConfig.connect();
            PreparedStatement ps = connection.prepareStatement("insert into roomcategories values(roomcategoryseq.nextval,?,?,?)");
            ps.setString(1, categoryname);
            ps.setString(2, description);
            ps.setString(3, roomcharge);
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
<title>Booking </title>
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
                   <% out.println( Utilities.getModal("booking",result,""));%>
                    <h2 class="<%=resultclass%>"><%=result%></h2>
                    <input type="hidden" name="check"> 
                    <div class="form-floating mb-3 mt-3">
                        <input value="<%=categoryname%>" type="text" required class="form-control" id="categoryname" placeholder="Enter Category" name="categoryname">
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
                        <textarea required  class="form-control" id="comment" name="description" placeholder="Comment goes here"><%=description%></textarea>
                        <label for="comment">Comments</label>
                        <div class="valid-feedback">Comments ok.</div>
                        <div class="invalid-feedback">Please fill out Comment.</div>

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
