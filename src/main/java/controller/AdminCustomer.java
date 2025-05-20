package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import model.User;

/**
 * Servlet implementation class AdminCustomer
 */
@WebServlet("/users")
public class AdminCustomer extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Instantiate UserDAO and fetch the customer list
        UserDAO userDAO = new UserDAO();
        ArrayList<User> customerList = userDAO.getCustomers(); // Get customers from the database

        // Set the customer list as a request attribute to pass to the JSP
        request.setAttribute("customerList", customerList);

        // Forward to admin-dashboard.jsp to display the data
        RequestDispatcher dispatcher = request.getRequestDispatcher("admindashboard.jsp");
        dispatcher.forward(request, response);
    }
}



