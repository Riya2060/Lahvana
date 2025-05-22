package controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.UserDAO;
import model.User;
import utility.encryptDecrypt;

@WebServlet("/Login")
public class Login extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        UserDAO userDAO = new UserDAO();

        try {
            // Encrypt the password before checking in DB
            String encryptedPassword = encryptDecrypt.encrypt(password);

            // Get full user object using email and encrypted password
            User user = userDAO.getUserByEmailAndPassword(email, encryptedPassword);

            if (user != null) {
                // Store user object in session
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("email", user.getEmail());
                session.setAttribute("role", user.getRole());
                session.setAttribute("userId", user.getId());

                // Redirect based on role
                if (user.getRole().equalsIgnoreCase("admin")) {
                    response.sendRedirect("pages/admindashboard.jsp");
                } else if (user.getRole().equalsIgnoreCase("customer")) {
                    response.sendRedirect("pages/customerdashboard.jsp");
                } else {
                    request.setAttribute("errorMessage", "Invalid role.");
                    request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
                }
            } else {
                // Invalid login
                request.setAttribute("errorMessage", "Invalid email or password.");
                request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An internal error occurred. Please try again.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("pages/login.jsp");
    }
}
