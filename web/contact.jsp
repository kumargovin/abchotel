<%@include file="includes/header.jsp" %>
 <head>
<title>contact us </title>

  
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


         <!-- Container (Contact Section) -->
         <div class="container-fluid">
             <div class="row">
                 <div class="col-sm-7"></div>
                     
                 <div class="col-sm-5">
<center>
<div id="contact" class="container-fluid bg-grey">
  <h2 class="text-center">CONTACT</h2>
  <div class="row">
    <div class="col-sm-12">
      <h6>Contact us and we'll get back to you within 24 hours.</h6>
      <p class="fw-normal"><span class="glyphicon glyphicon-map-marker"></span> Varanasi, India</p>
      <p class="fst-italic"><span class="glyphicon glyphicon-phone"></span>9260940595</p>
      <p class="fw-bold"><span  class="glyphicon glyphicon-phone" ></span> mrgovind7345@gmail.com</p>
    </div>
    <div class="col-sm-12 banner">
      <div class="row">
        <div class="col-sm-12 banner">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-12 banner">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
      <div class="row">
        <div class="col-sm-12 banner">
          <button class="btn-block btn btn-primary" type="submit">Send</button>
        </div>
      </div>
    </div>
  </div>
</div>
</center> 
                     
                     
                 </div>
             </div>
         </div>
        
           
         <!--************Body Ends ************--> 
          
          
        <!--************Footer Form Starts ************-->  
        <%@include file="includes/footer.jsp" %>
        <!--************Footer Form Ends ************-->
                      
    
</html>
