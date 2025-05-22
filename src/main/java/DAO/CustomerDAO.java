package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.DatabaseConnection;
import model.Customer;

public class CustomerDAO {
	public static Customer getCustomerById(int id) {
	    Customer c = null;
	    try (Connection con = DatabaseConnection.getConnection()) {
	        String sql = "SELECT * FROM customers WHERE id = ?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            c = new Customer(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("phone"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return c;
	}

	public static void updateCustomer(Customer customer) {
	    try (Connection con = DatabaseConnection.getConnection()) {
	        String sql = "UPDATE customers SET name=?, email=?, phone=? WHERE id=?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, customer.getName());
	        ps.setString(2, customer.getEmail());
	        ps.setString(3, customer.getPhone());
	        ps.setInt(4, customer.getId());
	        ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}


}
