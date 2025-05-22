package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale.Category;
import java.util.Map;

import database.DatabaseConnection;
import model.Product;

public class productDAO {

    private Connection con; 

    public productDAO() {
        try {
            this.con = DatabaseConnection.getConnection(); 
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
   

    // 1. Add Product
    public boolean addProduct(Product p) {
        boolean hasRowInserted = false;

        if (con == null) { 
            System.out.println("Database Connection Failed..");
            return hasRowInserted;
        }

        String query = "INSERT INTO products (name, description, price, quantity, image, category_id) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setInt(3, p.getPrice());
            ps.setInt(4, p.getQuantity());
            ps.setString(5, p.getImage());
            ps.setInt(6, p.getCategory_id());

            int rows = ps.executeUpdate();
            hasRowInserted = rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hasRowInserted;
    }

    // 2. Get All Products
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM products";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("price"),
                        rs.getInt("quantity"),
                        rs.getString("image"),
                        rs.getInt("category_id")
                );
                list.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 3. Get Product by ID
    public Product getProductById(int id) {
        String query = "SELECT * FROM products WHERE product_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Product(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("price"),
                        rs.getInt("quantity"),
                        rs.getString("image"),
                        rs.getInt("category_id")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // 4. Update Product
    public boolean updateProduct(Product p) {
        String sql = "UPDATE products SET name=?, description=?, price=?, quantity=?, image=?, category_id=? WHERE product_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setInt(3, p.getPrice());
            ps.setInt(4, p.getQuantity());
            ps.setString(5, p.getImage());
            ps.setInt(6, p.getCategory_id());
            ps.setInt(7, p.getProduct_id());

            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // 5. Delete Product
    public boolean deleteProduct(int product_id) {
        boolean result = false;
        try {
            // Delete dependent rows first
            PreparedStatement stmt1 = con.prepareStatement("DELETE FROM cart_product WHERE product_id = ?");
            stmt1.setInt(1, product_id);
            stmt1.executeUpdate();
            
            // Now delete the product
            PreparedStatement stmt2 = con.prepareStatement("DELETE FROM products WHERE product_id = ?");
            stmt2.setInt(1, product_id);
            result = stmt2.executeUpdate() > 0;

            stmt1.close();
            stmt2.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    public List<Product> getProductsByCategory(int categoryId) {
        List<Product> productList = new ArrayList<>();
        try {
           
            String sql = "SELECT * FROM products WHERE category_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                    rs.getInt("product_id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getInt("price"),
                    rs.getInt("quantity"),
                    rs.getString("image"),
                    rs.getInt("category_id")
                );
                productList.add(p);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productList;
    }

    
    public List<Product> searchProducts(String query) {
        List<Product> products = new ArrayList<>();
        try {
            
            String sql = "SELECT * FROM products WHERE name LIKE ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + query + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProduct_id(rs.getInt("product_id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getInt("price"));
                product.setImage(rs.getString("image"));
                // You can also add description, quantity, and category_id if needed
                products.add(product);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    }

