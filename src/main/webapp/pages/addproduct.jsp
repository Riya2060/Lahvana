<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #2d4733;
            text-align: center;
        }
        form {
            width: 500px;
            margin: 30px auto;
            background: white;
            padding: 30px;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 6px;
            margin-top: 15px;
        }
        input[type="text"],
        input[type="number"],
        input[type="file"],
        select {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        .btn {
            margin-top: 20px;
            width: 100%;
            background-color: #2d4733;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #3a5a41;
        }
    </style>
</head>
<body>

<h1>Add New Product</h1>

<form action="/Testing/AddProductServlet" method="post" enctype="multipart/form-data">
    <label>Name:</label>
    <input type="text" name="name" required>

    <label>Description:</label>
    <input type="text" name="description" required>

    <label>Price:</label>
    <input type="number" name="price" required>

    <label>Quantity:</label>
    <input type="number" name="quantity" required>

    <label>Image:</label>
    <input type="file" name="image" accept="image/*" required>

    <label>Category:</label>
 
    <select name="category_id" required>
        <option value="" disabled selected>Select Category</option>
        <c:forEach var="cat" items="${categoryList}">
            <option value="${cat.category_id}">${cat.name}</option>
        </c:forEach>
        <c:if test="${empty categoryList}">
            <option disabled>No categories available</option>
        </c:if>
    </select>


    <button type="submit" class="btn">Add Product</button>
</form>

</body>
</html>
