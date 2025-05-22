<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%
    String categoryIdParam = request.getParameter("category_id");
    int categoryId = 0;
    if (categoryIdParam != null) {
        try {
            categoryId = Integer.parseInt(categoryIdParam);
        } catch (NumberFormatException e) {
            categoryId = 0;
        }
    }
    List<Product> products = (List<Product>) request.getAttribute("products");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Ethnic Collection</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Pacifico&family=Montserrat:wght@400;600&family=Dancing+Script&display=swap" rel="stylesheet">

  <style>
    * { box-sizing: border-box; }
    body {
      font-family: 'Lora', serif;
      background: #ffffff;
      color: #000000;
      margin: 0;
      padding: 0;
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

    .brand img { height: 100px; }

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
      font-weight: bold;
      transition: color 0.3s;
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

    .login-box, .cart-icon {
      padding: 6px 12px;
      border: 1px solid black;
      border-radius: 8px;
      transition: background-color 0.3s, color 0.3s;
      color: black;
    }

    .login-box:hover, .cart-icon:hover {
      background-color: #f0e0c6;
      color: #bdc3a8;
      cursor: pointer;
    }

    h1 {
      text-align: center;
      padding: 10px;
      font-size: 36px;
      border-bottom: 1px solid #ddd;
    }

   .ethnics-category {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: stretch; /* force equal height */
  gap: 20px;
  padding: 20px;
  background-color: #f0e0c6;
}

.product-card {
  width: 280px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  border: 1px solid #ccc;
  border-radius: 12px;
  padding: 10px;
  background-color: #fff;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  text-align: center;
  transition: transform 0.3s;
  text-decoration: none;
  color: inherit;
  flex-grow: 1;
}

    .category-card {
      width: 300px;
      height: 400px;
      border: 1px solid #ccc;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s;
      cursor: pointer;
      background-color: #fff;
      text-align: center;
      display: flex;
      flex-direction: column;
      text-decoration: none;
      color: inherit;
      padding: 10px;
    }

    .category-card:hover, .product-card:hover {
      transform: translateY(-8px);
    }

    .category-card img, .product-card img {
      width: 100%;
      height: 70%;
      object-fit: cover;
      flex-grow: 1;
    }

    .category-card h3, .product-card h3 {
      margin: 5px 0;
      font-size: 18px;
      font-weight: bold;
    }

    .product-card button {
      margin: 5px;
      padding: 8px 12px;
      background-color: #258575;
      color: white;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      font-weight: bold;
    }

    .product-card button:hover {
      background-color: #1a5f4e;
    }

    @media (max-width: 768px) {
      .category-card, .product-card {
        width: 45%;
        height: 380px;
      }
    }
  </style>

  <script>
    function addToCart(productName) {
      alert(productName + " added to cart!");
    }

    function BuyNow(name, image) {
      window.location.href = "productdetails.jsp?name=" + encodeURIComponent(name) + "&image=" + encodeURIComponent(image);
    }
  </script>
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
        <form action="<%= request.getContextPath() %>/pages/Search.jsp" method="get">
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

  <h1>What Do You Want from Our Store?</h1>

  <div id="ethnics-home" class="ethnics-category">
    <%
      if (categoryId == 0) {
    %>
      <!-- Category Cards -->
      <a class="category-card" href="<%=request.getContextPath()%>/ethnicsproducts?category_id=2">
        <img src="<%=request.getContextPath()%>/images/lehenga/12.avif" alt="Lehenga">
        <h3>Lehenga</h3>
      </a>
      <a class="category-card" href="<%=request.getContextPath()%>/ethnicsproducts?category_id=1">
        <img src="<%=request.getContextPath()%>/images/sari/13.jpg" alt="Saree">
        <h3>Saree</h3>
      </a>
      <a class="category-card" href="<%=request.getContextPath()%>/ethnicsproducts?category_id=3">
        <img src="<%=request.getContextPath()%>/images/kutha/3.jpeg" alt="Kurtha">
        <h3>Kurtha</h3>
      </a>
      <a class="category-card" href="<%=request.getContextPath()%>/ethnicsproducts?category_id=4">
        <img src="<%=request.getContextPath()%>/images/Gown/10.jpg" alt="Gown">
        <h3>Gown</h3>
      </a>
    <%
      } else if (products != null && !products.isEmpty()) {
        for (Product p : products) {
    %>
      <div class="product-card">
  <img src="<%=request.getContextPath()%>/<%=p.getImage()%>" alt="<%=p.getName()%>">
  <div style="min-height: 50px;">
    <h3><%=p.getName()%></h3>
  </div>
        <form action="cartservlet" method="post" style="margin: 5px;">
          <input type="hidden" name="productId" value="<%= p.getProduct_id() %>">
          <input type="hidden" name="quantity" value="1">
          <button type="submit">Add to Cart</button>
        </form>
        <button onclick="BuyNow('<%=p.getName()%>', '<%=request.getContextPath()%>/<%=p.getImage()%>')">Buy Now</button>
      </div>
    <%
        }
      } else {
    %>
      <p style="text-align:center; font-size: 18px;">No products found for this category.</p>
    <%
      }
    %>
  </div>

</body>
</html>
