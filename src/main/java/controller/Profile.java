package controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.UserDAO;
import model.User;

@WebServlet("/Profile")
@MultipartConfig
public class Profile extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAO();

    public Profile() {
        super();
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

        // Form fields
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

        // Handle image
        Part part = request.getPart("image");
        String fileName = part.getSubmittedFileName();
        String imagePath = currentUser.getPhoto(); // default to current image
        System.out.println("Submitted file: " + fileName);

        if (fileName != null && !fileName.isEmpty()) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + "photos";
            System.out.println("Upload path: " + uploadPath);
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Save file
            String fullFilePath = uploadPath + File.separator + fileName;
            part.write(fullFilePath);
            System.out.println("Image saved at: " + fullFilePath);
            imagePath = "photos/" + fileName; // path to store in DB
        }

        try {
            // Check password if attempting to change
            if (currentPassword != null && !currentPassword.trim().isEmpty()) {
                if (!userDAO.validateCurrentPassword(originalEmail, currentPassword)) {
                    request.setAttribute("error", "Current password is incorrect.");
                    forwardToProfilePage(request, response, role);
                    return;
                }
            }

            // Use new password or old one
            String passwordToStore = (newPassword != null && !newPassword.isEmpty())
                    ? newPassword
                    : currentUser.getPassword();

            // Build updated user
            User updatedUser = new User(
                    0, firstName, lastName, username, email, passwordToStore,
                    phone, address, role, imagePath, dob, gender
            );

            // DB update
            boolean updated = userDAO.updateUserProfile(updatedUser, originalEmail);
            if (updated) {
                session.setAttribute("user", updatedUser);
                response.sendRedirect(request.getContextPath() +
                        (role.equalsIgnoreCase("customer")
                                ? "/pages/customerProfile.jsp?success=true"
                                : "/pages/editprofiles.jsp?success=true"));
            } else {
                request.setAttribute("error", "Update failed.");
                forwardToProfilePage(request, response, role);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Server error: " + e.getMessage());
            forwardToProfilePage(request, response, role);
        }
    }

    private void forwardToProfilePage(HttpServletRequest request, HttpServletResponse response, String role)
            throws ServletException, IOException {
        String page = role.equalsIgnoreCase("customer")
                ? "/pages/customerProfile.jsp"
                : "/pages/editprofiles.jsp";
        request.getRequestDispatcher(page).forward(request, response);
    }
}
