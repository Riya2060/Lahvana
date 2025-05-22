package controller;

import DAO.productDAO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteProductServlet")
public class DeleteProduct extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        deleteProduct(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        deleteProduct(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int product_id = Integer.parseInt(request.getParameter("product_id"));

            productDAO dao = new productDAO();
            boolean result = dao.deleteProduct(product_id);
            HttpSession session = request.getSession();

            if (result) {
            	session.setAttribute("message", "Product deleted successfully!");
                response.sendRedirect(request.getContextPath() + "/pages/product.jsp");
            } else {
                request.setAttribute("errorMessage", "Error deleting product.");
                RequestDispatcher rd = request.getRequestDispatcher("/pages/admindashboard.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Exception occurred: " + e.getMessage());
        }
    }
}
