package controller;

import DAO.UserDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.List;

@WebServlet("/user-list")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    // Handles GET requests - shows user list
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<User> userList = null;

        try {
            userList = userDAO.getAllUsers();
            System.out.println("GET: Fetched user list, size = " + (userList != null ? userList.size() : 0));
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving user list.");
        }

        request.setAttribute("userList", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/user-list.jsp");
        dispatcher.forward(request, response);
    }

    // Handles POST requests - delete user and refresh list
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String deleteId = request.getParameter("user_id");

        if (deleteId != null && !deleteId.isBlank()) {
            try {
                int userId = Integer.parseInt(deleteId);
                boolean deleted = userDAO.deleteUser(userId);
                System.out.println("POST: Attempted to delete user ID " + userId + " => " + (deleted ? "Success" : "Failed"));
            } catch (NumberFormatException e) {
                System.err.println("POST: Invalid user ID format: " + deleteId);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Always refresh user list after deletion
        doGet(request, response); // re-use doGet to fetch updated list
    }
}