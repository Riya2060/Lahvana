<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="DAO.productDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Product Management - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css"> <!-- Your custom CSS -->
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

    <!-- Main content area -->
    <main class="flex-grow-1 p-4">
        <h1 class="text-center text-success mb-4">Manage Products</h1>

        <!-- Success Message -->
        <%
            String successMessage = (String) session.getAttribute("message");
            if (successMessage != null) {
        %>
        <div class="alert alert-success alert-dismissible fade show mx-auto" role="alert" style="max-width: 90%;">
            <%= successMessage %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
                session.removeAttribute("message");
            }
        %>

        <!-- Add Product Button -->
        <div class="text-center mb-4">
            <a href="${pageContext.request.contextPath}/AddProductServlet" class="btn btn-success px-4">Add New Product</a>
        </div>

        <!-- Product Table -->
        <%
            productDAO dao = new productDAO();
            List<Product> products = dao.getAllProducts();
        %>

        <div class="table-responsive">
            <table class="table table-bordered table-hover bg-white" style="max-width: 95%; margin: auto;">
                <thead class="table-success text-center">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price ($)</th>
                        <th>Quantity</th>
                        <th>Image</th>
                        <th>Category ID</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody class="text-center align-middle">
                    <%
                        if (products != null && !products.isEmpty()) {
                            for (Product p : products) {
                    %>
                    <tr>
                        <td><%= p.getProduct_id() %></td>
                        <td><%= p.getName() %></td>
                        <td><%= p.getDescription() %></td>
                        <td><%= p.getPrice() %></td>
                        <td><%= p.getQuantity() %></td>
                        <td>
                            <img src="<%= request.getContextPath() + "/photos/" + p.getImage() %>" alt="Product Image" width="70" height="70">
                        </td>
                        <td><%= p.getCategory_id() %></td>
                        <td>
                            <a href="<%= request.getContextPath() + "/pages/editProduct.jsp?id=" + p.getProduct_id() %>" class="btn btn-success btn-sm mb-1">Edit</a>
                            <a href="<%= request.getContextPath() + "/DeleteProductServlet?product_id=" + p.getProduct_id() %>" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="8">No products found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
