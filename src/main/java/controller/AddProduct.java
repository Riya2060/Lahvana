package controller;

import DAO.CategoryDAO;
import DAO.productDAO;
import model.Category;
import model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet("/AddProductServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class AddProduct extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch categories
        CategoryDAO dao = new CategoryDAO();
        List<Category> categories = dao.getAllCategories();

        // Set to request
        request.setAttribute("categoryList", categories);

        // Forward to JSP
        request.getRequestDispatcher("/pages/addproduct.jsp").forward(request, response);
    }
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1. Get all form fields
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            int price = Integer.parseInt(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int category_id = Integer.parseInt(request.getParameter("category_id"));

            // 2. Handle the image upload
            Part part = request.getPart("image");
            String fileName = part.getSubmittedFileName();
            
         // Get and print the folder path
            String folderPath = getServletContext().getRealPath("/") + "photos";
            System.out.println("Folder Path: " + folderPath);

            // Define upload path (photos folder inside your app)
            String uploadPath = getServletContext().getRealPath("") + File.separator + "photos";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs(); // Create 'photos' directory if it doesn't exist
            }

            String fullFilePath = uploadPath + File.separator + fileName;
            part.write(fullFilePath); // Save uploaded image file

            // 3. Create product object
            Product p = new Product(0, name, description, price, quantity, fileName, category_id);

            // 4. Insert into database
            productDAO dao = new productDAO();
            boolean result = dao.addProduct(p);
            HttpSession session = request.getSession();

            if (result) {
            	session.setAttribute("message", "Product added successfully!");
                response.sendRedirect(request.getContextPath() + "/pages/product.jsp");// Redirect to product listing
            } else {
                request.setAttribute("errorMessage", "Error adding product.");
                RequestDispatcher rd = request.getRequestDispatcher("/pages/admindashboard.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Exception occurred: " + e.getMessage());
        }
    }
}
