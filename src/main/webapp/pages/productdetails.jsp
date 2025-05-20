<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Product Details</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Pacifico&family=Montserrat:wght@400;600&family=Dancing+Script&display=swap" rel="stylesheet">
  
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f5f5f5;
      color: #333;
      padding-top: 80px;
      padding: 20px;
      overflow-x: hidden;
    }
    .product-details {
      max-width: 800px;
      margin: auto;
      background-color: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }
    .product-details img {
      width: 100%;
      max-height: 400px; /* Set a maximum height */
      object-fit: contain;
      border-radius: 10px;
    }
    .product-details h2 {
      font-size: 30px;
      margin: 20px 0;
    }
    .product-details p {
      font-size: 18px;
      line-height: 1.5;
      margin-bottom: 20px;
    }
    .product-details button {
      padding: 10px 20px;
      background-color: #258575;
      color: white;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      font-size: 16px;
    }
    .product-details button:hover {
      background-color: #1a5f4e;
    }
  </style>
</head>

<body>

  <div class="product-details">
    <h2><%= request.getParameter("name") %></h2>
    <img src="<%= request.getParameter("image") %>" alt="<%= request.getParameter("name") %>" />
    <p>Details of the selected product will be displayed here. You can add additional information like price, sizes, colors, etc.</p>
    <button onclick="addToCart('<%= request.getParameter("name") %>')">Add to Cart</button>
  </div>

  <script>
    function addToCart(productName) {
      alert(productName + " added to cart!");
    }
  </script>
</body>
</html>
