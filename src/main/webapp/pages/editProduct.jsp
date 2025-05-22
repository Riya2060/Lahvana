<%@ page import="model.Product" %>
<%@ page import="DAO.productDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%


    int id = Integer.parseInt(request.getParameter("id"));
    productDAO dao = new productDAO();
    Product p = dao.getProductById(id);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f4f6f8;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #2d4733;
            margin-bottom: 20px;
        }
        .btn {
            background-color: #2d4733;
            color: white;
            border: none;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Edit Product</h1>
    <form action="<%= request.getContextPath() %>/EditProductServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="product_id" value="<%= p.getProduct_id() %>">
        
        <div class="mb-3">
            <label>Name</label>
            <input type="text" name="name" value="<%= p.getName() %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Description</label>
            <textarea name="description" class="form-control" required><%= p.getDescription() %></textarea>
        </div>
        <div class="mb-3">
            <label>Price</label>
            <input type="number" name="price" value="<%= p.getPrice() %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Quantity</label>
            <input type="number" name="quantity" value="<%= p.getQuantity() %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Category ID</label>
            <input type="number" name="category_id" value="<%= p.getCategory_id() %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Change Image (optional)</label>
            <input type="file" name="image" class="form-control">
            <br>
            <img src="<%= request.getContextPath() + "/photos/" + p.getImage() %>" width="100" height="100" alt="Current Image">
        </div>
        <div class="text-center">
            <button type="submit" class="btn">Update Product</button>
        </div>
    </form>
</div>

</body>
</html>