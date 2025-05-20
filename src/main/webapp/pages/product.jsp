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
    <link rel="stylesheet" href="styles.css"> <!-- Link to common stylesheet -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f6f8;
        }

        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 250px;
            background-color: #fff;
            border-right: 2px solid #ddd;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            padding-top: 20px;
        }

        .sidebar h2 {
            text-align: center;
            color: #2d4733;
        }

        .sidebar .nav {
            margin-top: 30px;
        }

        .sidebar .nav-item a {
            color: #333;
            padding: 10px 15px;
            text-decoration: none;
            display: block;
        }

        .sidebar .nav-item a:hover {
            background-color: #2d4733;
            color: white;
        }

        .main-content {
            margin-left: 250px;
            padding: 20px;
        }

        h1 {
            color: #2d4733;
            text-align: center;
        }

        table {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #2d4733;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            padding: 6px 12px;
            background-color: #2d4733;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
        }

        .btn:hover {
            background-color: #3a5a41;
        }

        .add-product {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<aside class="sidebar">
    <h2 class="text-success fw-bold">Lehvana</h2>
    <ul class="nav flex-column mt-4">
        <li class="nav-item"><a href="admindashboard.jsp" class="nav-link text-dark">Dashboard</a></li>
        <li class="nav-item"><a href="account.jsp" class="nav-link text-dark">Account</a></li>
        <li class="nav-item"><a href="users.jsp" class="nav-link text-dark">Users</a></li>
        <li class="nav-item"><a href="product.jsp" class="nav-link text-dark">Products</a></li>
        <li class="nav-item"><a href="orders.jsp" class="nav-link text-dark">Orders</a></li>
        <li class="nav-item"><a href="reports.jsp" class="nav-link text-dark">Reports</a></li>
        <li class="nav-item"><a href="logout.jsp" class="nav-link text-dark">Logout</a></li>
    </ul>
</aside>

<!-- Main Content -->
<div class="main-content">
    <h1>Manage Products</h1>

   <!-- Success Message Start -->
    <%
        String successMessage = (String) session.getAttribute("message");
        if (successMessage != null) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert" style="width: 90%; margin: 20px auto;">
        <%= successMessage %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
            session.removeAttribute("message");
        }
    %>
    <!-- Success Message End -->


    <div class="add-product">
        <a href="${pageContext.request.contextPath}/AddProductServlet" class="btn">Add New Product</a>
    </div>

    <%
        productDAO dao = new productDAO();
        List<Product> products = dao.getAllProducts();
    %>

    <table>
        <thead>
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
        <tbody>
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
                <td><img src="<%= request.getContextPath() + "/photos/" + p.getImage() %>" alt="Product Image" width="70" height="70"></td>
                <td><%= p.getCategory_id() %></td>
                <td>
                    <a href="<%= request.getContextPath() + "/pages/editProduct.jsp?id=" + p.getProduct_id() %>" class="btn">Edit</a>
                    <a href="<%= request.getContextPath() + "/DeleteProductServlet?product_id=" + p.getProduct_id() %>" class="btn" style="background-color: #b30000;">Delete</a>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
