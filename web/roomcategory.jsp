 <%@include file="includes/header.jsp" %>
 <head>
<title>roomcategory </title>

  
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
         <!--************Header Form Ends ************-->

           <!--************Menu Form Starts ************-->
        <%@include file="includes/menu.jsp" %>  
        
        <!--************Menu Form Ends ************-->
        
         <!--************Body Starts ************-->
         <div class="container mt-3"><center>
  <h1 style="color: red">Room Category </h1>
  <h4>Please select the room category:</4></center>
  <table class="table">
      <thead class="table-dark"></thead>
  </table>
    </div>
         
         <div class="row">
  <div class="col-md-3">
    <div class="thumbnail">
      <a href="singlebed.jsp">
          <img src="roomimages/3.jpg" class="rahstyle" alt="Lights" style="width:100%">
        <div class="caption">
          <h4>single bed...</h4>
        </div>
      </a>
    </div>
  </div>
  <div class="col-md-3">
    <div class="thumbnail">
      <a href="doublebed.jsp">
          <img src="roomimages/31.jpg" class="rahstyle" alt="Nature" style="width:100%">
        <div class="caption">
          <h4>double bed ...</h4>
        </div>
      </a>
    </div>
  </div>
  <div class="col-md-3">
    <div class="thumbnail">
      <a href="luxury.jsp">
          <img src="roomimages/24.jpg" class="rahstyle" alt="Fjords" style="width:100%">
        <div class="caption">
          <h4>luxury...</h4>
        </div>
      </a>
    </div>
  </div>
             <div class="col-md-3">
    <div class="thumbnail">
      <a href="deluxe.jsp">
          <img src="roomimages/11.jpg" class="rahstyle" alt="Fjords" style="width:100%">
        <div class="caption">
          <h4>deluxe...</h4>
        </div>
      </a>
    </div>
  </div>
</div>
         
         
         
          <!--************Body Ends ************--> 
          
          
                      <!--************Footer Form Starts ************-->  
                      <%@include file="includes/footer.jsp" %>
                      <!--************Footer Form Ends ************-->
                      
    </body>
</html>
