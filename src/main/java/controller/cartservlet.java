package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.CartDAO;

@WebServlet("/cartservlet")
public class cartservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            System.out.println("User is not logged in. Redirecting to login page.");
            response.sendRedirect("pages/login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        System.out.println("Received add to cart request:");
        System.out.println("userId: " + userId);
        System.out.println("productId: " + productId);
        System.out.println("quantity: " + quantity);

        try {
            CartDAO cartDAO = new CartDAO();
            int cartId = cartDAO.getOrCreateCartByUserId(userId);
            System.out.println("Working with cartId: " + cartId);

            cartDAO.addToCart(cartId, productId, quantity);
            cartDAO.updateCartTotalAmount(cartId);

            System.out.println("Product added to cart successfully.");

            request.getRequestDispatcher("/pages/cart.jsp").forward(request, response);// Redirect to cart page
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");}
        }
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            int cartItemId = Integer.parseInt(request.getParameter("cart_item_id"));
            int userId = Integer.parseInt(request.getParameter("user_id"));

            try {
                CartDAO cartDAO = new CartDAO();
                boolean deleted = cartDAO.deleteCartItem(cartItemId);

                if (deleted) {
                    response.sendRedirect("pages/cart.jsp?user_id=" + userId + "&msg=Item+Removed");
                } else {
                    response.sendRedirect("pages/cart.jsp?user_id=" + userId + "&msg=Delete+Failed");
                }

            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        }
}