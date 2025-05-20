<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Offers</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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


    .container {
      max-width: 1200px;
      margin: auto;
      text-align: center;
    }

    h1 {
      font-size: 36px;
      color: #222;
      margin-bottom: 50px;
      letter-spacing: 1px;
    }

    .offers-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 30px;
    }

    .offer {
      background-color: #fff;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      padding-bottom: 20px;
    }

    .offer:hover {
      transform: translateY(-5px);
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
    }

    .offer img {
      width: 100%;
      height: auto;
    }

    .offer h2 {
      font-size: 22px;
      padding: 15px 10px 5px;
      color: #111;
    }

    .offer p {
      padding: 0 20px;
      font-size: 15px;
      color: #444;
    }

    .shop-btn {
      display: inline-block;
      margin-top: 15px;
      padding: 10px 20px;
      background-color:  #e0d0a0;
      color: black;
      border-radius: 8px;
      text-decoration: none;
      font-weight: bold;
      transition: background-color 0.3s;
    }

    .shop-btn:hover {
      background-color: #1c6a5e;
    }

    @media (max-width: 500px) {
      h1 {
        font-size: 28px;
      }
      .offer h2 {
        font-size: 18px;
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
      <a href="cart.jsp" class="cart-icon"><i class="fas fa-shopping-cart"></i></a>
    </div>
  </nav>

  <div class="container">
    <div class="offers-grid">
      <div class="offer">
       <img src="<%=request.getContextPath()%>/images/offers/photoshoot.jpg" alt="Free Delivery Offer">
        <h2>Free Delivery Over Rs.9999</h2>
        <p>Enjoy free shipping across Nepal on orders above Rs. 9999.</p>
        <a href="ethnics.html" class="shop-btn">Shop Now</a>
      </div>

      <div class="offer">
        <img src="<%=request.getContextPath()%>/images/offers/new.jpg" alt="New Year Sale">
        <h2>New Year Sale  Up to 50% OFF!</h2>
        <p>Start the year with style! Save up to 50% on trendy wear.</p>
        <a href="ethnics.html" class="shop-btn">Shop Now</a>
      </div>
      
      <div class="offer">
        <img src="<%=request.getContextPath()%>/images/offers/sales.png" alt="30% Off">
        <h2>Wedding Season Offers</h2>
        <p>Enjoy your wedding season with our branded clothes and the discounts.</p>
        <a href="ethnics.html" class="shop-btn">Shop Now</a>
      </div>
    </div>
  </div>

</body>
</html>
