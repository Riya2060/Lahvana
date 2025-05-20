package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.productDAO;
import model.Product;

/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the search query from the URL parameter (e.g., ?query=product)
        String query = request.getParameter("query");
       
        if (query == null || query.isEmpty()) {
            // If no search query is entered, redirect back to the homepage
            response.sendRedirect("index.jsp");
            return;
        }

        // Get the list of products matching the search query
        productDAO productDAO = new productDAO();
        List<Product> products = productDAO.searchProducts(query);
// Set the products as an attribute for use in the JSP page
request.setAttribute("products", products);
// Forward the request to the search.jsp page
request.getRequestDispatcher("pages/Search.jsp").forward(request, response);
    }
}

