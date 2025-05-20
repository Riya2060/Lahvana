package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UserDAO;
import model.User;

@WebServlet("/editprofile")
public class editprofile extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    // ✅ Handle GET request to load the edit form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }

        String email = (String) session.getAttribute("email");
        String role = (String) session.getAttribute("role");

        User user = null;

        if ("admin".equals(role)) {
            // Admin may want to edit someone else's profile
            String targetEmail = request.getParameter("email");
            if (targetEmail != null && !targetEmail.isEmpty()) {
                user = userDAO.getUserByEmail(targetEmail);
            } else {
                user = userDAO.getUserByEmail(email); // Admin editing their own profile
            }
        } else {
            // Customers can only edit their own profile
            user = userDAO.getUserByEmail(email);
        }

        if (user == null) {
            request.setAttribute("errorMessage", "User not found.");
        } else {
            request.setAttribute("user", user);
        }

        request.getRequestDispatcher("/pages/editprofile.jsp").forward(request, response);
    }

    // ✅ Handle POST request to submit the edited form
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }

        String email = (String) session.getAttribute("email");
        String role = (String) session.getAttribute("role");

        User user = null;

        if ("admin".equals(role)) {
            String targetEmail = request.getParameter("email");
            if (targetEmail != null && !targetEmail.isEmpty()) {
                user = userDAO.getUserByEmail(targetEmail);
            } else {
                user = userDAO.getUserByEmail(email);
            }
        } else {
            user = userDAO.getUserByEmail(email);
        }

        if (user == null) {
            request.setAttribute("errorMessage", "User not found.");
            request.getRequestDispatcher("/pages/editprofile.jsp").forward(request, response);
            return;
        }

        // Get form values
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String password = request.getParameter("password");
        String address = request.getParameter("address");

        // Update user object
        user.setFirstname(firstName);
        user.setLastname(lastName);
        user.setPassword(password);
        user.setAddress(address);

        try {
            boolean success = userDAO.updateUser(user);
            if (success) {
                request.setAttribute("successMessage", "Profile updated successfully!");
            } else {
                request.setAttribute("errorMessage", "Failed to update profile.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error occurred.");
        }

        request.setAttribute("user", user);
        request.getRequestDispatcher("/pages/editprofile.jsp").forward(request, response);
    }
}
