<%@ page import="java.util.List" %>
<%@ page import="model.CartItem" %>
<%@ page import="DAO.CartDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Ensure the user is logged in
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("/pages/login.jsp");
        return;
    }

    List<CartItem> cartItems = null;
    double total = 0.0;

    try {
        CartDAO cartDAO = new CartDAO();
        cartItems = cartDAO.getCartItemsByUserId(userId);

        for (CartItem item : cartItems) {
            total += item.getPrice() * item.getQuantity();
        }

    } catch (SQLException | ClassNotFoundException e) {
        out.println("<p>Error loading cart items: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #2d4733;
            color: white;
        }

        img {
            width: 100px;
            height: auto;
        }

        .total {
            font-size: 18px;
            font-weight: bold;
            text-align: right;
            margin-top: 20px;
        }

        .btn {
            padding: 8px 16px;
            background-color: #2d4733;
            color: white;
            text-decoration: none;
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #3a5b42;
        }
    </style>
</head>
<body>

    <h1>Your Shopping Cart</h1>

    <% if (cartItems != null && !cartItems.isEmpty()) { %>
        <table>
            <thead>
                <tr>
                    
                    <th>Product</th>
                    <th>Price (per item)</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <% for (CartItem item : cartItems) { %>
                    <tr>
                        
                        <td><%= item.getProductName() %></td>
                        <td>Rs. <%= item.getPrice() %></td>
                        <td><%= item.getQuantity() %></td>
                        <td>Rs. <%= item.getPrice() * item.getQuantity() %></td>
                        
                      
                    </tr>
                <% } %>
            </tbody>
        </table>

        <div class="total">
            Grand Total: Rs. <%= total %>
        </div>

        <br/>
        <form action="checkout.jsp">
            <button class="btn" type="submit">Proceed to Checkout</button>
        </form>

    <% } else { %>
        <p>Your cart is empty.</p>
    <% } %>

</body>
</html>
