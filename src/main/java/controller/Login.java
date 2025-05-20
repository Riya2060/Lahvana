package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.UserDAO;
import model.User;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect GET requests to login page
        response.sendRedirect("pages/login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
		User user = userDAO.getUserByEmailAndPassword(email, password);

		if (user != null) {
		    HttpSession session = request.getSession();
		    session.setAttribute("user_id", user.getUser_id());
		    session.setAttribute("email", user.getEmail());
		    session.setAttribute("role", user.getRole());
		    session.setAttribute("user_name", user.getFirstname());

		    Cookie emailCookie = new Cookie("email", user.getEmail());
		    emailCookie.setMaxAge(60 * 60 * 24 * 7);
		    emailCookie.setHttpOnly(true);
		    response.addCookie(emailCookie);

		    Cookie roleCookie = new Cookie("role", user.getRole());
		    roleCookie.setMaxAge(60 * 60 * 24 * 7);
		    roleCookie.setHttpOnly(true);
		    response.addCookie(roleCookie);

		    if ("admin".equalsIgnoreCase(user.getRole())) {
		        response.sendRedirect("pages/admindashboard.jsp");
		    } else {
		        response.sendRedirect("pages/customerdashboard.jsp");
		    }
		} else {
		    request.setAttribute("errorMessage", "Invalid email or password.");
		    request.getRequestDispatcher("pages/login.jsp").forward(request, response);
		}
    }
}