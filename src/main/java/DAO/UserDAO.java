package DAO;

import java.sql.*;
import java.util.ArrayList;
import database.DatabaseConnection;
import model.User;

public class UserDAO {
    private Connection con;

    public UserDAO() {
        try {
            this.con = DatabaseConnection.getConnection();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    // Add user
    public boolean addUser(User user) throws SQLException {
        String query = "INSERT INTO users (first_name, last_name, email, password, address, role) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, user.getFirstname());
            ps.setString(2, user.getLastname());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getRole());
            return ps.executeUpdate() > 0;
        }
    }

    // Get all users
    public ArrayList<User> getUsers() {
        ArrayList<User> users = new ArrayList<>();
        String query = "SELECT * FROM users";

        try (PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                users.add(new User(
                    rs.getInt("user_id"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("address"),
                    rs.getString("role")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    // Get role (login)
    public String getUserRole(String email, String password) throws SQLException {
        String query = "SELECT role FROM users WHERE email = ? AND password = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("role");
                }
            }
        }
        return null;
    }

    // Get user by email
    public User getUserByEmail(String email) {
        String query = "SELECT * FROM users WHERE email = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new User(
                        rs.getInt("user_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("address"),
                        rs.getString("role")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get user by email and password (returns full User)
    public User getUserByEmailAndPassword(String email, String password) {
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                	System.out.println("Querying user: " + email + " | " + password);
                    return new User(
                        rs.getInt("user_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("address"),
                        rs.getString("role")
                    );
                    
                  
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
       
    }

    // Update user
    public boolean updateUser(User user) throws SQLException {
        String query = "UPDATE users SET first_name = ?, last_name = ?, password = ?, address = ? WHERE user_id = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, user.getFirstname());
            ps.setString(2, user.getLastname());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getAddress());
            ps.setInt(5, user.getUser_id());
            return ps.executeUpdate() > 0;
        }
    }

    // Get all customers
    public ArrayList<User> getCustomers() {
        ArrayList<User> customers = new ArrayList<>();
        String query = "SELECT * FROM users WHERE role = 'customer'";
        try (PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                customers.add(new User(
                    rs.getInt("user_id"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("address"),
                    rs.getString("role")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

}
