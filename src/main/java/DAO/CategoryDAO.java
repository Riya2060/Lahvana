package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import database.DatabaseConnection;
import model.Category;

public class CategoryDAO {
    private Connection con;

    public CategoryDAO() {
        try {
            this.con = DatabaseConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

   
    	public List<Category> getAllCategories() {
    	    List<Category> list = new ArrayList<>();
    	    String sql = "SELECT category_id, category_name FROM categories";

    	    try (PreparedStatement ps = con.prepareStatement(sql);
    	         ResultSet rs = ps.executeQuery()) {

    	        while (rs.next()) {
    	            Category c = new Category();
    	            c.setCategory_id(rs.getInt("category_id"));
    	            c.setName(rs.getString("category_name"));
    	            System.out.println("Fetched category: " + c.getName());
    	            list.add(c);
    	        }

    	        if (list.isEmpty()) {
    	            System.out.println("No categories found in the database.");
    	        }
    	    } catch (SQLException e) {
    	        e.printStackTrace();
    	    }

    	    return list;
    	}
    	public static void main(String[] args) {
    	    CategoryDAO dao = new CategoryDAO();
    	    List<Category> categories = dao.getAllCategories();
    	    System.out.println("Total categories found: " + categories.size());
    	}
    }
