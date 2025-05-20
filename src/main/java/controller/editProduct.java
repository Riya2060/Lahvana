package controller;

import DAO.productDAO;
import model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/EditProductServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class editProduct extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1. Get all form fields
            int product_id = Integer.parseInt(request.getParameter("product_id"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            int price = Integer.parseInt(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int category_id = Integer.parseInt(request.getParameter("category_id"));

            // 2. Handle the image upload
            Part part = request.getPart("image");
            String fileName = part.getSubmittedFileName();

            String uploadPath = getServletContext().getRealPath("") + File.separator + "photos";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            if (fileName != null && !fileName.isEmpty()) {
                String fullFilePath = uploadPath + File.separator + fileName;
                part.write(fullFilePath);
            } else {
                // If no new image uploaded, keep existing image
                productDAO dao = new productDAO();
                Product existingProduct = dao.getProductById(product_id);
                fileName = existingProduct.getImage();
            }

            // 3. Create updated product object
            Product updatedProduct = new Product(product_id, name, description, price, quantity, fileName, category_id);

            // 4. Update in database
            productDAO dao = new productDAO();
            boolean result = dao.updateProduct(updatedProduct);
            HttpSession session = request.getSession();

            if (result) {
            	session.setAttribute("message", "Product updated successfully!");
                response.sendRedirect(request.getContextPath() + "/pages/product.jsp"); // Redirect to product listing
            } else {
                request.setAttribute("errorMessage", "Error updating product.");
                RequestDispatcher rd = request.getRequestDispatcher("/pages/admindashboard.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Exception occurred: " + e.getMessage());
        }
    }
}
