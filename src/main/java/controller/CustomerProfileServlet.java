package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.UserDAO;
import model.User;

@WebServlet("/profile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 2 * 1024 * 1024) // 2MB
public class CustomerProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User currentUser = (User) session.getAttribute("user");
        String originalEmail = currentUser.getEmail();
        String role = currentUser.getRole();

        // Gather form data
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone_number");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String currentPassword = request.getParameter("current_password");
        String newPassword = request.getParameter("new_password");

        // Photo upload
        Part photoPart = request.getPart("profile_photo");
        String photoFileName = currentUser.getPhoto(); // Default

        if (photoPart != null && photoPart.getSize() > 0 && photoPart.getSubmittedFileName() != null) {
            photoFileName = Paths.get(photoPart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("/") + "uploads";
            Files.createDirectories(Paths.get(uploadPath));
            photoPart.write(uploadPath + File.separator + photoFileName);
        }

        try {
            // Validate current password if attempting to change password
            if (currentPassword != null && !currentPassword.trim().isEmpty()) {
                if (!userDAO.validateCurrentPassword(originalEmail, currentPassword)) {
                    request.setAttribute("error", "Current password is incorrect.");

                    String page = "customer".equalsIgnoreCase(role)
                            ? "/pages/customerProfile.jsp"
                            : "/pages/editprofiles.jsp";

                    request.getRequestDispatcher(page).forward(request, response);
                    return;
                }
            }

            // Use new password if provided, else retain old one
            String passwordToStore = (newPassword != null && !newPassword.isEmpty())
                    ? newPassword
                    : currentUser.getPassword();

            // Create updated user object
            User updatedUser = new User(0, firstName, lastName, username, email, passwordToStore,
                    phone, address, role, photoFileName, dob, gender);

            // Update DB
            boolean updated = userDAO.updateUserProfile(updatedUser, originalEmail);

            if (updated) {
                session.setAttribute("user", updatedUser);

                String redirectPage = "customer".equalsIgnoreCase(role)
                        ? "/pages/customerProfile.jsp?success=true"
                        : "/pages/editprofiles.jsp?success=true";

                response.sendRedirect(request.getContextPath() + redirectPage);
            } else {
                request.setAttribute("error", "Update failed.");

                String page = "customer".equalsIgnoreCase(role)
                        ? "/pages/customerProfile.jsp"
                        : "/pages/editprofiles.jsp";

                request.getRequestDispatcher(page).forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Server error: " + e.getMessage());

            String page = "customer".equalsIgnoreCase(role)
                    ? "/pages/customerProfile.jsp"
                    : "/pages/editprofiles.jsp";

            request.getRequestDispatcher(page).forward(request, response);
        }
    }
}
