       <!--************Header Starts ************-->

<%@include file="includes/header.jsp" %>
  <title>index </title>
</head>
<body>

    <div class="container-fluid">
    
        <div style="background-size: cover ;background-image: url('images/temp.jpg')"  class="p-5 bg-primary text-white text-center">
   <b class="display-1">Hotel Star</b>
   <p class="fw-bold">A hotel is just a place to lay your head.
     !</p> 
        </div>
            <!--************Header Ends ************-->
        
        
             <!--************Menu Starts ************-->
    
    <%@include file="includes/menu.jsp" %>  
            <!--************Menu Ends ************-->
    
    
            <!--************Body Starts ************-->
    <div class="col-sm-12 banner"> 
        <!-- The slideshow/carousel -->
                
                <div id="demo" class="carousel slide" data-bs-ride="carousel">

    
                    <div class="carousel-indicators">
                      <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                      <button type="button" data-bs-target="#demo" data-bs-slide-to="1" class="active"></button>
                      <button type="button" data-bs-target="#demo" data-bs-slide-to="2" class="active"></button>
                      <button type="button" data-bs-target="#demo" data-bs-slide-to="3" class="active"></button>
                      <button type="button" data-bs-target="#demo" data-bs-slide-to="4" class="active"></button>
                      <button type="button" data-bs-target="#demo" data-bs-slide-to="5" class="active"></button>
                    </div>
                  
                    <!-- The slideshow/carousel -->
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img class="style" src="images/hotel.jpg" alt="Varanasi"> 
                      </div>
                      <div class="carousel-item">
                        <img class="style"src="images/receptionists.jpg" alt="Varanasi" >
                      </div>
                      <div class="carousel-item">
                        <img class="style"src="images/villa.jpg"  alt="Varanasi">
                      </div>
                      <div class="carousel-item">
                          <img class="style"src="images/receptionist2.jpg"  alt="Varanasi">
                      </div>
                         <div class="carousel-item">
                             <img class="style"src="images/people.jpg"  alt="Varanasi">
                      </div>
                         <div class="carousel-item">
                        <img class="style"src="images/house.jpg"  alt="Varanasi">
                      </div>

                    </div>
                  
                    <!-- Left and right controls/icons -->
                    <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                      <span class="carousel-control-prev-icon"></span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                      <span class="carousel-control-next-icon"></span>
                    </button>
                  </div>
            
        
            </div>
       </div>
       <!--************Body Ends ************-->
       
       
       <!--************Privacy footer ************-->
         <center>
            <div class="container">   
                <div class="row"> 
                    <div class="col-sm-12 privacy">
    <p class="fw-bold"><span class="glyphicon glyphicon-map-marker"></span> Varanasi,Uttar Pradesh, India</p>
    <p href="https://support.google.com/websearch/answer/179386?gl=IN&hl=en-GB" class="link-primary">Learn more</p>
    <a href="https://about.google/?hl=en-GB" class="link-primary">About</a>
    <a href="https://policies.google.com/privacy?hl=en-GB" class="link-primary">Privacy</a>
    <a href="https://policies.google.com/terms?hl=en-GB" class="link-primary">Terms</a>
    <a href="https://google.qualtrics.com/jfe/form/SV_3NMIMtX0F2zkakR?reserved%3D1%26utm_source%3DFooter%2520link%26utm_medium%3Down_web%26%20utm_campaign%3DQ1%26productTag%3Dothr%26campaignDate%3DMarch2020%26referral_code%3DUXDT415223&Q_Language=en-GB" class="link-primary">Join user studies</a>
    <a href="https://support.google.com/travel/?hl=en-GB#topic=7687750" class="link-primary">Help Center</a>
    <a href="https://support.google.com/local-listings/answer/9851099?p=how_google_sources&gl=IN&hl=en-GB&visit_id=637801170983102414-2586959188&rd=1" class="link-primary">About this data</a><br>
    <a>We will either find a way, or make one.</a>       
      <a href="https://www.google.com/googlefinance/disclaimer/?hl=en-GB&gl=IN" class="link-primary">Learn more</a>              
                    </div>
                </div>
            </div>
             <!--************Privacy footer ************-->
   
    
            <!--************Footer Starts ************-->

     <%@include file="includes/footer.jsp" %>
     
            <!--************Footer Ends ************-->
     
</body>
</html>
