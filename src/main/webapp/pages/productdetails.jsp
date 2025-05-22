<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Product Detail</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      background-color: #f9f9f9;
    }
    .product-container {
      display: flex;
      background-color: white;
      border-radius: 12px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      overflow: hidden;
      max-width: 1000px;
      margin: auto;
    }
    .product-image {
      flex: 1;
      max-width: 50%;
    }
    .product-image img {
      width: 100%;
      height: auto;
    }
    .product-details {
      flex: 1;
      padding: 30px;
    }
    .product-details h2 {
      margin-top: 0;
      font-size: 28px;
    }
    .product-details p {
      font-size: 16px;
      margin: 10px 0;
    }
    .price {
      font-size: 22px;
      color: #d63447;
      margin: 15px 0;
    }
    .btn {
      display: inline-block;
      padding: 10px 20px;
      font-size: 16px;
      margin-top: 20px;
      background-color: #0a74da;
      color: white;
      text-decoration: none;
      border-radius: 8px;
    }
    .btn:hover {
      background-color: #075bb5;
    }
  </style>
</head>
<body>

  <div class="product-container">
    <div class="product-image">
       <img src="<%=request.getContextPath()%>/images/sari/1.jpeg" alt="New Arrival 1">
    </div>
    <div class="product-details">
      <h2>Plain Border Saree</h2>
      <p>Elegant maroon saree with a subtle golden border, perfect for traditional events and festive gatherings.</p>
      <p class="price">Rs 2,499</p>
      <p><strong>Available Sizes:</strong> Free Size</p>
      <p><strong>Fabric:</strong> Georgette</p>
      <p><strong>In Stock:</strong> Yes</p>
      <a href="#" class="btn">Add to Cart</a>
    </div>
  </div>

</body>
</html>
