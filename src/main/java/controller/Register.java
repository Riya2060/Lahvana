package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import model.User;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String role = request.getParameter("role");
		
		System.out.println("Firstname: " + first_name );
		System.out.println("Lastname: " + last_name );
		System.out.println("Email: " + email );
		System.out.println("Password: " + password );
		System.out.println("address: " + address );
		System.out.println("role: " + role );
		
		
		User user = new User(first_name,last_name,email,password,address,role);
		UserDAO userDAO = new UserDAO();
		 try {
	            boolean isRegistered = userDAO.addUser(user);

	            if (isRegistered) {
	                // ✅ Redirect to login page after successful registration
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
		
		
		
	


