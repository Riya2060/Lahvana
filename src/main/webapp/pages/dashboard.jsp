<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Lehvana</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Pacifico&family=Montserrat:wght@400;600&family=Dancing+Script&display=swap" rel="stylesheet">
  <style>
    * {
      box-sizing: border-box;
    }
    body {
  font-family: 'Lora', serif; 
  background: #ffffff;
  color: #ffffff;
  padding-top: 80px;
}
  nav {
  background: linear-gradient(to right, #ffffff, #ffffff);
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 80px;
  padding: 0 20px; 
  color: #ffffff;
  box-shadow: 0 2px 10px #ffffff;
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 1000;
}


    .brand {
      font-size: 2.2rem;
      font-weight: bold;
      display: flex;
      align-items: center;
      gap: 5px;
      font-family: 'Arial', serif;
    }

    .brand img {
      height: 100px;
    }

    .nav-links {
      display: flex;
      align-items: center;
      gap: 30px;
      font-size: 1.2rem;
      font-weight: bold;
    }

    .nav-links a {
      color: #000000;
      text-decoration: none;
      font-weight: 600;
      transition: color 0.3s;
      font-weight: bold;
    }

    .nav-links a:hover {
      color: #258575;
    }

    .search-bar {
      position: relative;
    }

    .search-bar input {
      padding: 6px 20px;
      border: 1px solid black;
      border-radius: 8px;
      transition: background-color 0.3s, color 0.3s;
      color: black;
    }

    .search-bar i {
      position: absolute;
      right: 10px;
      top: 50%;
      transform: translateY(-50%);
      color: #1d1c1b;
    }

    .login-box,
    .cart-icon {
      padding: 6px 12px;
      border: 1px solid black;
      border-radius: 8px;
      transition: background-color 0.3s, color 0.3s;
      color: black;
    }

    .login-box:hover,
    .cart-icon:hover {
      background-color: #f0e0c6;
      color: #bdc3a8;
      cursor: pointer;
    }

    .poster {
      height: 100vh;
      overflow: hidden;
      position: relative;
    }

    .poster img {
      width: 600%;
      height: 250%;
      object-fit: cover;
      filter: brightness(95%);
    }

    .poster h1 {
      position: absolute;
      bottom: 10px;
      left:10px;
      font-size: 5rem;
      font-family: 'Lora', serif;
      text-shadow: 2px 2px 8px #040404;
    }

    .poster h1 a {
      color: #ffffff;
      text-decoration: none;
    }

    .poster h1 a:hover {
      text-decoration: underline; }

      .why-rent-section {
        
  background-color: #f8f9fa; /* light background */
  padding: 50px 0;
}

.why-rent-title {
  font-size: 3rem; /* You can adjust as needed */
  font-family: 'Lora', serif;
  text-align: center;
}

.why-rent-title a {
  color: #000000;
  text-decoration: none;
}

.why-rent-title a:hover {
  text-decoration: underline;
}



.feature-boxes {
  display: flex; /* Align items horizontally */
  justify-content: space-between; /* Space out the boxes */
  gap: 20px; /* Gap between the boxes */
}

.feature-box {
  background-color: #f0e0c6;
  color: rgb(0, 0, 0);
  padding: 30px;
  border-radius: 12px;
  transition: transform 0.3s ease;
  flex: 1; /* Ensure all boxes are of equal width */
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  
}

.feature-box:hover {
  transform: scale(1.07);
}

.feature-title {
  font-size: 1.6rem;
  font-weight: bold;
  margin-bottom: 5px;
}

.feature-desc {
  font-size: 1rem;
  opacity: 0;
  transition: opacity 0.4s ease-in-out;
  padding: 5px;
}

.feature-box:hover .feature-desc {
  opacity: 1;
}


#reviews h2 {
  font-family: 'Lora', serif;
  text-align: center;
  font-size: 2.5rem;
  margin-bottom: 40px;
  color: #000000;
}

.review-slideshow {
  max-width: 600px;
  margin: 0 auto;
  position: relative;
  min-height: 100px;
}

.review-slide {
  position: absolute;
  opacity: 0;
  transition: opacity 3s ease-in-out;
  text-align: center;
  padding: 20px;
  font-size: 1.3rem;
  font-style: italic;
  color: #000000;
}

.review-slide h4 {
  margin-top: 15px;
  font-weight: bold;
  font-size: 1.3rem;
  font-style: normal;
}

.review-slide.active {
  opacity: 6;
  position: relative;
}
    footer {
      background: linear-gradient(to right, #7c806d);
      color: white;
      text-align: center;
      padding: 10px;
    }

    footer .social-icons i {
      margin: 12px;
      font-size: 2rem;
      transition: color 0.3s;
    }

    footer .social-icons i:hover {
      color: #ffffff;
    }

    .section-box div::-webkit-scrollbar {
      height:5px;
    }

    .section-box div::-webkit-scrollbar-thumb {
      background: #ffffff;
      border-radius: 20px;
    }

    .section-box div::-webkit-scrollbar-track {
      background: #ffffff;
    }

    @media (max-width: 768px) {
      .section-box a {
        width: 180px;
      }

      .poster h1 {
        font-size: 2.5rem;
      }
    }

#categories {
  background-color: #f8f9fa;
  padding: 5px ;
}

#categories h2 {
  font-family: 'Lora', serif;
  font-size: 3rem;
  color: #000000;
  margin-bottom: 30px;
  text-align: center;
}

#categories div {
  display: flex;
  gap: 120px;
  justify-content: center;
  flex-wrap: wrap;
}

#categories a {
  text-decoration: none;
  color: #000000;
  text-align: center;
  width: 150px;
  margin-bottom: 30px;
}

#categories a img {
  width: 160%;
  height: 400px;
  object-fit: cover;
  border-radius: 8px;
}

#categories a:hover img,
#new-arrivals a:hover img {
  transform: scale(1.05);
  transition: transform 0.3s ease;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* New Arrivals Section */
#new-arrivals {
  background-color: #f8f9fa;
  padding: 5px ;
}

#new-arrivals h2 {
  font-family: 'Lora', serif;
  font-size: 3rem;
  color: #000000;
  margin-bottom: 30px;
  text-align: center;
}

#new-arrivals div {
  display: flex;
  gap: 110px;
  justify-content: center;
  flex-wrap: wrap;
}

#new-arrivals a {
  text-decoration: none;
  color: #000000;
  text-align: center;
  width: 150px;
  margin-bottom: 30px;
}

#new-arrivals a img {
  width: 160%;
  height: 400px;
  object-fit: cover;
  border-radius: 8px;
}
#categories a:hover,
#new-arrivals a:hover {
  transform: scale(1.05);
  transition: transform 0.3s ease;
  text-decoration: underline;
}

    .slideshow {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: -1;
}
.slideshow img {
  width: 100%;
  height: 100%;
  object-fit: contain; 
  object-position: center;
  position: absolute;
  opacity: 0;
  animation: slideShow 15s infinite;
  background-color: #ffffff; /* optional: fills space around image */
}


.slideshow img:nth-child(1) { animation-delay: 0s; }
.slideshow img:nth-child(2) { animation-delay: 5s; }
.slideshow img:nth-child(3) { animation-delay: 10s; }

@keyframes slideShow {
  0% { opacity: 0; }
  10% { opacity: 1; }
  30% { opacity: 1; }
  40% { opacity: 0; }
  100% { opacity: 0; }
}

@media (max-width: 700px) {
  .poster {
    height: 10vh;
  }
}
footer {
  background: linear-gradient(#2d2d2d);
  color: white;
  text-align: center;
  padding: 50px ;
  font-family: 'Montserrat', sans-serif;
}

footer .social-icons i {
  margin: 10px;
  font-size: 1rem;
  transition: transform 0.3s ease;
}

footer .social-icons i:hover {
  transform: scale(1.3);
  color: #f4e8d6;
}

  </style>
</head>

<body>
  <nav>
    <div class="brand">
      <a href="dashboard.jsp"> <!-- This is the clickable link -->
        <img src="<%=request.getContextPath()%>/images/Logo/logo.png" alt="Logo" />
      </a>
    </div>
    
    <div class="nav-links">
      <a href="offers.jsp">Offers</a>
      <a href="new-in.jsp">New In</a>
      <a href="ethnics.jsp">Products</a>
      <a href="aboutus.jsp">About Us</a>

      <div class="search-bar">
        <form class="search-bar" action="<%= request.getContextPath() %>/pages/Search.jsp" method="get">
  <input type="text" name="query" placeholder="Search..." required />
  <button type="submit" style="border: none; background: none; position: absolute; right: 10px; top: 50%; transform: translateY(-50%);">
    <i class="fas fa-search" style="color: #1d1c1b;"></i>
  </button>
</form>
      </div>
      <a href="login.jsp" class="login-box">Login</a>
      <a href="cart.jsp" class="cart-icon"><i class="fas fa-shopping-cart"></i></a>
    </div>
  </nav>




<div class="poster">
  <div class="slideshow">
    <img src="<%=request.getContextPath()%>/images/Dashboard slideshow/manyyyy.avif" alt="Slide 1">
    <img src="<%=request.getContextPath()%>/images/Dashboard slideshow/nppp.jpg" alt="Slide 2">
    <img src="<%=request.getContextPath()%>/images/Dashboard slideshow/m1.jpg" alt="Slide 3">
  </div>
  <h1 ><a href="offers.jsp">New Year Sale!</a></h1>
</div>


<section class="why-rent-section my-5">
  <div class="container text-center">

    <h2 class="why-rent-title">
      <a href="about.html">Why our store??</a>
    </h2>
    
    
    <div class="feature-boxes">
      <div class="feature-box">
        <h5 class="feature-title">Eco-Friendly Choices</h5>
        <p class="feature-desc">Shop sustainably with our curated collection of eco-conscious items.</p>
      </div>
      <div class="feature-box">
        <h5 class="feature-title">Quality Guarantee</h5>
        <p class="feature-desc">We stand by our products and customers satisfaction guaranteed or your money back.</p>
      </div>
      <div class="feature-box">
        <h5 class="feature-title">24/7 Customer Support</h5>
        <p class="feature-desc">We are here to help you anytime, anywhere we are just a click away.</p>
      </div>
    </div>
  </div>
</section>


<section id="categories" class="section-box">
  <h2><a href="<%=request.getContextPath()%>/ethnics.html">Categories</a></h2>
  <div>
    <a href="<%=request.getContextPath()%>/ethnicsproducts?category_id=1">
      <img src="<%=request.getContextPath()%>/images/sari/17.jpg" alt="Saree"><br>Saree
    </a>
    <a href="<%=request.getContextPath()%>/ethnicsproducts?category_id=2">
      <img src="<%=request.getContextPath()%>/images/lehenga/11.jpg" alt="Lehenga"><br>Lehenga
    </a>
    <a  href="<%=request.getContextPath()%>/ethnicsproducts?category_id=4">
      <img src="<%=request.getContextPath()%>/images/Gown/7.jpg" alt="Gown"><br>Gown
    </a>
    <a href="<%=request.getContextPath()%>/ethnicsproducts?category_id=3">
      <img src="<%=request.getContextPath()%>/images/kutha/1.avif" alt="Kurtha"><br>Kurtha
    </a>
    
  </div>
</section>


<!-- New Arrivals Section -->
<section id="new-arrivals" class="section-box">
  <h2><a href="<%=request.getContextPath()%>/new-in.html">New Arrivals</a></h2>
  <div>
    <a href="<%=request.getContextPath()%>/pages/productdetails.jsp">
      <img src="<%=request.getContextPath()%>/images/sari/1.jpeg" alt="New Arrival 1"><br>Plain Border Saree
    </a>
    <a href="<%=request.getContextPath()%>/new-in.html">
      <img src="<%=request.getContextPath()%>/images/lehenga/8.jpg" alt="New Arrival 2"><br>Floral Printed Lehenga
    </a>
    <a href="<%=request.getContextPath()%>/new-in.html">
      <img src="<%=request.getContextPath()%>/images/Gown/5.jpg" alt="New Arrival 3"><br>Simple Elegant Gown
    </a>
    <a href="<%=request.getContextPath()%>/new-in.html">
      <img src="<%=request.getContextPath()%>/images/kutha/7.jpeg" alt="New Arrival 4"><br>Garara Set
    </a>
    <a href="<%=request.getContextPath()%>/new-in.html">
      <img src="<%=request.getContextPath()%>/images/lehenga/10.jpg" alt="New Arrival 5"><br>Heavy Embroided lehenga
    </a>
    
  </div>
</section>


    <div class="section-box" id="reviews">
    <h2>Customer Reviews</h2>
    
    <div class="review-slideshow">
      <div class="review-slide active">
        <p>"Absolutely loved the saree I purchased for my sister's wedding. It looked so pretty and felt luxurious!</p>
        <h4>- Anjali Sharma</h4>
      </div>
      <div class="review-slide">
        <p>"The lehenga was stunning!I feel like a princess . Will purchase again!"</p>
        <h4>- Priya Mehta</h4>
      </div>
      <div class="review-slide">
        <p>"I was skeptical at first, but this site exceeded my expectations. Amazing quality and service!"</p>
        <h4>- Neha Rai</h4>
      </div>
    </div>
  </div>


  <script>
    let currentReview = 0;
    const slides = document.querySelectorAll('.review-slide');
  
    function showSlide(index) {
      slides.forEach((slide, i) => {
        slide.classList.remove('active');
        if (i === index) slide.classList.add('active');
      });
    }
  
    setInterval(() => {
      currentReview = (currentReview + 1) % slides.length;
      showSlide(currentReview);
    }, 7000);
  </script>
  
</body>
<footer>
    <div class="social-icons">
      <a href="#"><i class="fab fa-facebook-f" style="color: white;"></i></a>
      <a href="#"><i class="fab fa-instagram" style="color: white;"></i></a>
      <a href="#"><i class="fab fa-twitter" style="color: white;"></i></a>
      <a href="#"><i class="fab fa-pinterest" style="color: white;"></i></a>
      <p>&copy; 2025 Lehvana</p>
    </div>
  </footer>
  </html>