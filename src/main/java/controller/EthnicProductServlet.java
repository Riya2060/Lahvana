package controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.CategoryDAO;
import DAO.productDAO;

import javax.servlet.*;

import database.DatabaseConnection;
import model.Category;
import model.Product;

@WebServlet("/ethnicsproducts")
public class EthnicProductServlet extends HttpServlet {
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int categoryId = Integer.parseInt(request.getParameter("category_id"));

	        productDAO productDao = new productDAO();
	        List<Product> products = productDao.getProductsByCategory(categoryId);

	        CategoryDAO categoryDAO = new CategoryDAO();
	        List<Category> categories = categoryDAO.getAllCategories();

	        request.setAttribute("categoryList", categories);
	        request.setAttribute("products", products);
	        request.setAttribute("selectedCategory", categoryId);

	        request.getRequestDispatcher("/pages/Customerproduct.jsp").forward(request, response);
	    }
	}
