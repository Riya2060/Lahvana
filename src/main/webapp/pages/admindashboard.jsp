<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Rental Shop Admin Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="styles.css"> <!-- Link to common stylesheet -->
</head>
<body class="bg-light">

<div class="d-flex min-vh-100">
<%
  // Get the current URI for active link highlighting
  String currentURI = request.getRequestURI();
%>
  
<aside class="bg-white border-end p-3" style="width: 250px; height: 100vh;">
    <h2 class="text-success fw-bold">Lehvana</h2>
    <ul class="nav flex-column mt-4">
        <li class="nav-item"><a href="admindashboard.jsp" class="nav-link text-dark">Dashboard</a></li>
        <li class="nav-item"><a href="editprofiles.jsp" class="nav-link text-dark">Account</a></li>
		<li class="sidebar__item">
	    <li class="nav-item">
		  <a href="<%= request.getContextPath() %>/user-list" 
		     class="nav-link text-dark<%= currentURI.endsWith("/user-list.jsp") ? " active" : "" %>">
		    Users
		  </a>
		</li>
        <li class="nav-item"><a href="product.jsp" class="nav-link text-dark">Products</a></li>
        <li class="nav-item"><a href="orders.jsp" class="nav-link text-dark">Orders</a></li>
        <li class="nav-item"><a href="reports.jsp" class="nav-link text-dark">Reports</a></li>
        <li class="nav-item"><a href="logout.jsp" class="nav-link text-dark">Logout</a></li>
    </ul>
</aside>
  <!-- Main Content -->
  <main class="flex-grow-1 p-4">
    <!-- Dashboard Section -->
    <div id="dashboard-content" class="content-section">
      <h2 class="text-success mb-4">Admin Dashboard</h2>
      <div class="row mb-4">
        <div class="col-md-3">
          <div class="bg-white p-3 rounded shadow-sm">
            <p class="text-muted mb-1">Total Orders</p>
            <h5 class="text-success">9</h5>
          </div>
        </div>
        <div class="col-md-3">
          <div class="bg-white p-3 rounded shadow-sm">
            <p class="text-muted mb-1">Total Revenue</p>
            <h5 class="text-success">Rs 12,345</h5>
          </div>
        </div>
        <div class="col-md-3">
          <div class="bg-white p-3 rounded shadow-sm">
            <p class="text-muted mb-1">Total Customers</p>
            <h5 class="text-success">5</h5>
          </div>
        </div>
        <div class="col-md-3">
          <div class="bg-white p-3 rounded shadow-sm">
            <p class="text-muted mb-1">Items Ordered</p>
            <h5 class="text-success">33</h5>
          </div>
        </div>
      </div>

      <div class="bg-white p-4 rounded shadow-sm mb-4">
        <h5 class="text-success">Welcome to the Admin Dashboard</h5>
        <p class="text-muted">Manage rentals, track stats, and monitor inventory all in one place.</p>
      </div>

      <div class="row mb-4">
        <div class="col-md-8">
          <div class="bg-white p-4 rounded shadow-sm text-center text-muted" style="height: 200px;">
            Revenue (Last 6 Months)<br/>[Chart Placeholder]
          </div>
        </div>
      </div>

      <div class="bg-white p-4 rounded shadow-sm mb-4">
        <h5 class="text-success">Top ordered Items</h5>
        <table class="table table-bordered table-sm mt-3">
          <thead class="table-success">
            <tr>
              <th>Product</th>
              <th>Price</th>
              <th>Category</th>
              <th>Total order</th>
              <th>Earnings</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Red Gown</td>
              <td>Rs 2,500</td>
              <td>Party Wear</td>
              <td>78</td>
              <td>Rs 1,950</td>
            </tr>
            <tr>
              <td>Sherwani</td>
              <td>Rs 3,500</td>
              <td>Traditional</td>
              <td>50</td>
              <td>Rs 1,500</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- Customer List Section -->
      <div class="bg-white p-4 rounded shadow-sm mb-4">
        <h5 class="text-success">Customer List</h5>
        <table class="table table-bordered table-sm mt-3">
          <thead class="table-success">
            <tr>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Email</th>
              <th>Address</th>
              <th>Role</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="customer" items="${customerList}">
              <tr>
                <td>${customer.firstname}</td>
                <td>${customer.lastname}</td>
                <td>${customer.email}</td>
                <td>${customer.address}</td>
                <td>${customer.role}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

      <div class="bg-white p-4 rounded shadow-sm text-center">
        <h5 class="text-success">Monthly Target</h5>
        <h3 class="text-success">76%</h3>
        <p class="text-muted">You've earned $3,267 today. Keep it up!</p>
      </div>
    </div>
  </main>
</div>

</body>
</html>
