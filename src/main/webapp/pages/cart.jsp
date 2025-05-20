<%@ page import="java.util.List" %>
<%@ page import="model.CartItem" %>
<%@ page import="DAO.CartDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .cart-container {
            max-width: 900px;
            margin: 120px auto 40px;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            font-family: Arial, sans-serif;
        }
        .cart-item {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding: 15px 0;
        }
        .cart-item img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin-right: 20px;
            border-radius: 5px;
        }
        .cart-item-details {
            flex-grow: 1;
        }
        .cart-item-details h3 {
            margin: 0 0 8px 0;
        }
        .cart-item-details p {
            margin: 4px 0;
        }
        .cart-total {
            font-weight: bold;
            text-align: right;
            margin-top: 25px;
            font-size: 18px;
        }
        .purchase-btn {
            background-color: #28a745;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.3s ease;
        }
        .purchase-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<%
    if (session == null || session.getAttribute("user_id") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int userId = (Integer) session.getAttribute("user_id");
    double total = 0.0;
    List<CartItem> cartItems = null;

    try {
        CartDAO cartDAO = new CartDAO();
        cartItems = cartDAO.getCartItemsByUserId(userId);
    } catch (Exception e) {
        out.println("<div class='container text-danger'>Error loading cart items: " + e.getMessage() + "</div>");
    }
%>

<div class="cart-container">
    <h2>Your Shopping Cart</h2>

    <% if (cartItems == null || cartItems.isEmpty()) { %>
        <p>Your cart is empty.</p>
    <% } else {
        for (CartItem item : cartItems) {
            total += item.getPrice() * item.getQuantity();
    %>
        <div class="cart-item">
            <img src="<%= request.getContextPath() + "/photos/" + item.getImagePath() %>" alt="<%= item.getProductName() %>">
            <div class="cart-item-details">
                <h3><%= item.getProductName() %></h3>
                <p>Price: ₹<%= String.format("%.2f", item.getPrice()) %></p>
                <p>Quantity: <%= item.getQuantity() %></p>
            </div>
        </div>
    <% } %>

        <div class="cart-total">
            Total: ₹<%= String.format("%.2f", total) %>
        </div>

        <form action="checkoutServlet" method="post">
            <button class="purchase-btn" type="submit">Proceed to Checkout</button>
        </form>
    <% } %>
</div>

</body>
</html>
