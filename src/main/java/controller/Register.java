package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import DAO.UserDAO;
import model.User;

@WebServlet("/Register")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
                 maxFileSize = 1024 * 1024 * 10,       // 10MB
                 maxRequestSize = 1024 * 1024 * 50)    // 50MB
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String user_name = request.getParameter("user_name");
        String dob = request.getParameter("dob");  // dob as string (no changes to the User model)
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm_password");
        String phone_number = request.getParameter("phone_number");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");

        // Hardcoded role
        String role = "Admin";

        // File upload logic
        Part filePart = request.getPart("photo");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        filePart.write(uploadPath + File.separator + fileName);

        // Password confirmation check
        if (!password.equals(confirm_password)) {
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("pages/register.jsp").forward(request, response);
            return;
        }

        // ⚠️ DO NOT encrypt here. DAO handles encryption.
        User user = new User(0, first_name, last_name, user_name, email, password, phone_number, address, role, fileName, dob, gender);

        try {
            UserDAO userDAO = new UserDAO();
            boolean isRegistered = userDAO.addUser(user);

            if (isRegistered) {
                response.sendRedirect("pages/login.jsp?message=registered");
            } else {
                request.setAttribute("errorMessage", "Registration failed! Try again.");
                request.getRequestDispatcher("pages/register.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred. Please try again.");
            request.getRequestDispatcher("pages/register.jsp").forward(request, response);
        }
    }
}