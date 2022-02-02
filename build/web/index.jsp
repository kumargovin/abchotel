<%@include file="includes/header.jsp" %>
  <title>Hotel Star </title>
</head>
<body>

<div class="p-5 bg-primary text-white text-center">
  <h1> Hotel Star </h1>
  <p>A hotel is just a place to lay your head.
!</p> 
</div>

    
    <%@include file="includes/menu.jsp" %>   
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
                        <img class="style"src="images/people.jpg"  alt="Varanasi">
                      </div>
                         <div class="carousel-item">
                        <img class="style"src="images/stars.jpg"  alt="Varanasi">
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
    
    
    


    <%@include file="includes/footer.jsp" %>
</body>
</html>
