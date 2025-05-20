<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Rental Shop Admin - Users</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="styles.css"> <!-- Link to common stylesheet -->
</head>
<body class="bg-light">

<div class="d-flex min-vh-100">
  
  <!-- Sidebar -->
  <aside class="bg-white border-end p-3" style="width: 250px; height: 100vh;">
    <h2 class="text-success fw-bold">Lehvana</h2>
    <ul class="nav flex-column mt-4">
      <li class="nav-item"><a href="dashboard.jsp" class="nav-link text-dark">Dashboard</a></li>
      <li class="nav-item"><a href="account.jsp" class="nav-link text-dark">Account</a></li>
      <li class="nav-item"><a href="users.jsp" class="nav-link text-dark">Users</a></li>
      <li class="nav-item"><a href="product.jsp" class="nav-link text-dark">Products</a></li>
      <li class="nav-item"><a href="orders.jsp" class="nav-link text-dark">Orders</a></li>
      <li class="nav-item"><a href="reports.jsp" class="nav-link text-dark">Reports</a></li>
      <li class="nav-item"><a href="logout.jsp" class="nav-link text-dark">Logout</a></li>
    </ul>
  </aside>

  <!-- Main Content -->
  <main class="flex-grow-1 p-4">
    <div id="users-content" class="content-section">
      <h2 class="text-success mb-4">User Management</h2>

      <!-- User Table Section -->
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
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="user" items="${customerList}">
              <tr>
                <td>${user.firstname}</td>
                <td>${user.lastname}</td>
                <td>${user.email}</td>
                <td>${user.address}</td>
                <td>${user.role}</td>
                <td>
                  <a href="editUser.jsp?email=${user.email}" class="btn btn-sm btn-warning">Edit</a>
                  <a href="deleteUser.jsp?email=${user.email}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

    </div>
  </main>
</div>

</body>
</html>
