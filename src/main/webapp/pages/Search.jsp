<%@ page import="java.util.*, java.io.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    String query = request.getParameter("query");

    if (query == null) query = "";

    query = query.toLowerCase();



    class Product {

        String name, image, description;



        Product(String name, String image, String description) {

            this.name = name;

            this.image = image;

            this.description = description;

        }



        boolean matches(String q) {

            return name.toLowerCase().contains(q) || description.toLowerCase().contains(q);

        }

    }



    List<Product> allProducts = new ArrayList<>();

    allProducts.add(new Product("Plain Border Saree", "images/sari/1.jpeg", "Elegant plain saree"));

    allProducts.add(new Product("Floral Printed Lehenga", "images/lehenga/8.jpg", "Colorful lehenga for weddings"));

    allProducts.add(new Product("Elegant Gown", "images/Gown/5.jpg", "Gown for evening events"));

    allProducts.add(new Product("Garara Set", "images/kutha/7.jpeg", "Stylish Garara suit"));



    List<Product> results = new ArrayList<>();

    for (Product p : allProducts) {

        if (p.matches(query)) {

            results.add(p);

        }

    }

%>



<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Search Results</title>

    <style>

        body {

            font-family: Arial, sans-serif;

            padding: 20px;

        }



        h2 {

            color: #333;

        }



        /* Search bar styling */

        .search-container {

            text-align: center;

            margin-bottom: 20px;

        }



        .search-bar {

            width: 100%;

            padding: 10px;

            font-size: 16px;

            border-radius: 25px;

            border: 2px solid #ccc;

            outline: none;

            transition: all 0.3s ease;

        }



        .search-bar:focus {

            border-color: #007BFF;

        }



        .search-bar-container {

            display: flex;

            justify-content: center;

        }



        .search-bar-button {

            background-color: #007BFF;

            color: white;

            border: none;

            padding: 12px 20px;

            border-radius: 25px;

            cursor: pointer;

            font-size: 16px;

            margin-left: 10px;

        }



        .search-bar-button:hover {

            background-color: #0056b3;

        }



        /* Product result styling */

        .product {

            border: 1px solid #ccc;

            padding: 10px;

            margin: 15px 0;

            width: 300px;

            display: inline-block;

            vertical-align: top;

        }



        .product img {

            width: 100%;

            height: auto;

        }

    </style>

</head>

<body>

    <div class="search-container">

        <form action="Search.jsp" method="get" class="search-bar-container">

            <input type="text" name="query" class="search-bar" placeholder="Search products..." value="<%= query %>">

            <button type="submit" class="search-bar-button">Search</button>

        </form>

    </div>



    <h2>Search Results for "<%= query %>"</h2>



    <%

        if (results.isEmpty()) {

    %>

        <p>No results found.</p>

    <%

        } else {

            for (Product p : results) {

    %>

        <!-- Display each product in a "product" div -->

        <div class="product">

            <img src="<%= request.getContextPath() + "/" + p.image %>" alt="<%= p.name %>">

            <h3><%= p.name %></h3>

            <p><%= p.description %></p>

        </div>

    <%

            }

        }

    %>

</body>

</html>