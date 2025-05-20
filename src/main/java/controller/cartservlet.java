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

    public cartservlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            HttpSession session = request.getSession(false);
            if (session == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            
            Integer userIdObj = (Integer) session.getAttribute("user_id");
            if (userIdObj == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            int userId = userIdObj;

            CartDAO cartDAO = new CartDAO();
            int cartId = cartDAO.getOrCreateCartByUserId(userId);
            cartDAO.addToCart(cartId, productId, quantity);
            cartDAO.updateCartTotalAmount(cartId);

            response.sendRedirect("pages/cart.jsp");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid product or quantity.");
            request.getRequestDispatcher("pages/error.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error.");
            request.getRequestDispatcher("pages/error.jsp").forward(request, response);
        }
    }
}