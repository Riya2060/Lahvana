<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <title>About Us - Lehvana Collection</title>
  
  <style>
    * {
      box-sizing: border-box;
    }

    body {
      font-family: 'Lora', serif;
      background: #ffffff;
      color: #000000;
      margin: 0;
      padding: 0;
    }

    nav {
      position: fixed;    /* --- NEW --- */
      top: 0;
      left: 0;
      width: 100%;
      background: linear-gradient(to right, #ffffff, #ffffff);
      display: flex;
      justify-content: space-between;
      align-items: center;
      height: 80px;
      padding: 0 20px;
      box-shadow: 0 2px 10px #eee;
      z-index: 1000;
    }

    .brand img {
      height: 130px;
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
      color: black;
    }

    .login-box:hover,
    .cart-icon:hover {
      background-color: #f0e0c6;
      color: #f0e0c6;
      cursor: pointer;
    }

    .hero {
      margin-top: 80px; /* --- NEW --- */
      background-color: #f0e0c6;
      height: 60vh;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      padding: 0 1rem;
    }

    .hero-content {
      max-width: 700px;
    }

    .hero h1 {
      font-size: 3rem;
      margin-bottom: 1rem;
      color: #362d1e;
    }

    .hero p {
      font-size: 1.2rem;
      color: #5a5244;
    }

    .section {
      padding: 4rem 2rem;
      max-width: 1200px;
      margin: auto;
    }

    .box {
      background-color: #f9f1d7;
      border-radius: 12px;
      padding: 2rem;
      margin-bottom: 2rem;
      box-shadow: 0 4px 12px rgba(0,0,0,0.08);
      transition: transform 0.3s ease;
      
    }

    .box:hover {
      
      transform: translateY(-4px);
    }

    .box h2 {
      margin-bottom: 1rem;
      color: #362d1e;
    }

    .box p {
      font-size: 1.1rem;
      line-height: 1.6;
      color: #333;
    }

    .row-boxes {
      display: flex;
      gap: 2rem;
      flex-wrap: wrap;
    }

    .half-box {
      flex: 1 1 calc(50% - 2rem);
    }

    .team {
      display: flex;
      flex-wrap: wrap;
      gap: 2rem;
      margin-top: 2rem;
    }

    .team-member {
      flex: 1 1 calc(33% - 2rem);
      background-color: #ffffff;
      border-radius: 10px;
      padding: 1rem;
      text-align: center;
      box-shadow: 0 2px 8px rgba(0,0,0,0.05);
      transition: transform 0.3s ease;
    }

    .team-member:hover {
      background-color: #f0e0c6;
      transform: translateY(-4px);
    }

    .team-member h3 {
      margin-bottom: 0.5rem;
      color: #362d1e;
    }

    .team-member p {
      font-size: 1rem;
      color: #000000;
    }

    .contact {
      background-color: #f9f1d7;
      border-radius: 12px;
      padding: 2rem;
      margin-top: 3rem;
      box-shadow: 0 4px 12px rgba(0,0,0,0.08);
      transition: background-color 0.3s ease, transform 0.3s ease;
    }

    .contact:hover {
      background-color: #f0e0c6;
      transform: translateY(-4px);
    }

    .contact h2 {
      color: #362d1e;
      margin-bottom: 1rem;
    }

    .contact p {
      color: black;
      font-size: 1.05rem;
    }

    @media (max-width: 768px) {
      .hero h1 {
        font-size: 2rem;
      }

      .hero p {
        font-size: 1rem;
      }

      .team-member,
      .half-box {
        flex: 1 1 100%;
      }

      .row-boxes {
        flex-direction: column;
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
        <input type="text" placeholder="Search..." />
        <i class="fas fa-search"></i>
      </div>
      <a href="#login" class="login-box">Login</a>
      <a href="#cart" class="cart-icon"><i class="fas fa-shopping-cart"></i></a>
    </div>
  </nav>

  <section class="hero">
    <div class="hero-content">
      <h1>We Style Your Moments</h1>
      <p>Experience the elegance of ethnic fashion with confidence and convenience. Shop, shine, and celebrate yourself beautifully and effortlessly.</p>
    </div>
  </section>

  <div class="section">
    <div class="box">
      <h2>Our Vision</h2>
      <p>To be the leading destination for ethnic fashion where every outfit tells a story, and every customer feels confident and celebrated.</p>
    </div>

    <div class="row-boxes">
      <div class="box half-box">
        <h2>WHAT WE STAND FOR</h2>
        <h3>Empowering Traditional Fashion</h3>
        <p>We are dedicated to making ethnic fashion accessible, stylish, and high quality. Our mission is to help people look their best while embracing culture and craftsmanship.</p>
      </div>
      <div class="box half-box">
        <h2>OUR PROMISE</h2>
        <h3>Style for Every Story</h3>
        <p>Whether it's a wedding, festival, or casual day out, we ensure you have access to handpicked outfits that reflect your personality and values.</p>
      </div>
    </div>

    <div class="box">
      <h2>Meet Our Team</h2>
      <div class="team">
        <div class="team-member">
          <img src="" alt="Riya Nepali">
          <h3>Riya Nepali</h3>
          <p><strong>Founder & CEO</strong><br>Leads the vision and growth of our platform with passion and purpose.</p>
        </div>
        <div class="team-member">
          <img src="" alt="Asmita Rana">
          <h3>Asmita Rana</h3>
          <p><strong>Creative Director</strong><br>Curates our ethnic collections to ensure style and authenticity.</p>
        </div>
        <div class="team-member">
          <img src="" alt="Kabita Rana">
          <h3>Kabita Rana</h3>
          <p><strong>Operations Manager</strong><br>Oversees logistics and ensures smooth customer experiences.</p>
        </div>
        <div class="team-member">
          <img src="" alt="Sunita Poudel">
          <h3>Sunita Poudel</h3>
          <p><strong>Customer Experience Lead</strong><br>Helps customers find the perfect outfits and service.</p>
        </div>
        <div class="team-member">
          <img src="" alt="Kripa Pandey">
          <h3>Kripa Pandey</h3>
          <p><strong>Marketing & Outreach</strong><br>Spreads our brand story and style across communities.</p>
        </div>
      </div>
    </div>

    <div class="contact">
      <h2>Contact Us</h2>
      <p><strong>Email:</strong> lehvanaofficial@gmail.com</p>
      <p><strong>Phone:</strong> +977-9876543210</p>
      <p><strong>Location:</strong> Pokhara, Nepal</p>
    </div>
  </div>

</body>
</html>
