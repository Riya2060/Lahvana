<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>New In | Wardrobe for Rent</title>
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
}
    nav {
  background: linear-gradient(to right, #ffffff,#ffffff);
  font-family: 'Lora', serif; 
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 80px;
  padding: 0 20px; 
  color: #ffffff;
  box-shadow: 0 2px 10px #ffffff;
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

    body {
      margin: 1;
      font-family: 'Lora', serif;
      background: #f5f0e6;
      color: #362d1e;
      overflow-x: hidden;
    }

    .section-box {
      width: 100%;
      padding: 90px 50px;
      text-align: center;
      background: linear-gradient(to right, #ffffff, #ffffff);
    }

    .section-box h2 {
      font-family: 'Lora', serif;
      font-size: rem;
      margin-bottom: 40px;
      color: #000000;
      text-shadow: 1px 1px 3px #ffffff;
    }

    .section-box div {
      display: flex;
      flex-wrap: wrap;
      gap: 30px;
      justify-content: center;
    }

    .section-box a {
      width: 350px;
      text-decoration: none;
      color: #3f2b2b;
      transition: transform 0.3s, box-shadow 0.3s;
      font-weight: 00;
    }

    .section-box img {
      width: 100%;
      height: 600px;
      object-fit: cover;
      border-radius: 12px;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
      transition: transform 0.4s, box-shadow 0.4s;
    }

    .section-box img:hover {
      transform: scale(1.07);
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.3);
    }

    footer {
      background: linear-gradient(to right, #ffffff, #ffffff);
      color: white;
      text-align: center;
      padding: 25px 0;
    }

    footer .social-icons i {
      margin: 0 12px;
      font-size: 1.5rem;
      transition: color 0.3s;
    }

    footer .social-icons i:hover {
      color: #ffffff;
    }

    @media (max-width: 768px) {
      .section-box a {
        width: 180px;
      }
    }
  </style>
</head>

<body>
  <nav>
    <div class="brand">
      <a href="dashboard.jsp"> 
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
      <a href="cart.html" class="cart-icon"><i class="fas fa-shopping-cart"></i></a>
    </div>
  </nav>


  <div class="section-box">
  <div>
    <a href="#"><img src="<%=request.getContextPath()%>/images/Blouse/9.jpg" alt="Product 1"><br>Product 1</a>
      <a href="#"><img src="<%=request.getContextPath()%>/images/Gown/3.jpg" alt="Product 2"><br>Product 2</a>
      <a href="#"><img src="<%=request.getContextPath()%>/images/kutha/11.jpeg" alt="Product 3"><br>Product 3</a>
      <a href="#"><img src="<%=request.getContextPath()%>/images/lehenga/3.jpg" alt="Product 4"><br>Product 4</a>
      <a href="#"><img src="<%=request.getContextPath()%>/images/Gown/7.jpg" alt="Product 5"><br>Product 5</a>
      <a href="#"><img src="<%=request.getContextPath()%>/images/Blouse/3.jpg" alt="Product 6"><br>Product 6</a>
      <a href="#"><img src="<%=request.getContextPath()%>/images/lehenga/9.jpg" alt="Product 7"><br>Product 7</a>
      <a href="#"><img src="<%=request.getContextPath()%>/images/sari/4.jpeg" alt="Product 8"><br>Product 8</a>
      
  </div>
</div>
