package DAO;

import model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import database.DatabaseConnection;
import utility.encryptDecrypt;

public class UserDAO {
    private Connection con;

    // Constructor - Establishes database connection
    public UserDAO() {
        try {
            this.con = DatabaseConnection.getConnection();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Database connection failed.", e);
        }
    }

    // Map ResultSet to User object
    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        return new User(
        	rs.getInt("user_id"), 
            rs.getString("first_name"),
            rs.getString("last_name"),
            rs.getString("user_name"),
            rs.getString("email"),
            rs.getString("password"),
            rs.getString("phone_number"),
            rs.getString("address"),
            rs.getString("role"),
            rs.getString("photo"),
            rs.getString("dob"),
            rs.getString("gender")
        );
    }


    // Add a new user
    public boolean addUser(User user) throws SQLException {
        String sql = "INSERT INTO users (first_name, last_name, user_name, email, password, phone_number, address, role, photo, dob, gender) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, user.getFirst_name());
            ps.setString(2, user.getLast_name());
            ps.setString(3, user.getUser_name());
            ps.setString(4, user.getEmail());
            ps.setString(5, encryptDecrypt.encrypt(user.getPassword())); // Encrypt password
            ps.setString(6, user.getPhone_number());
            ps.setString(7, user.getAddress());
            ps.setString(8, user.getRole());
            ps.setString(9, user.getPhoto());
            ps.setString(10, user.getDob());
            ps.setString(11, user.getGender());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error adding User.");
            e.printStackTrace();
            return false;
        }
    }

    // Get a user profile by email
    public User getUserProfileByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM users WHERE email = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUser(rs);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error getting users details.");
            e.printStackTrace();
        }

        return null;
    }

    // Update user profile
    public boolean updateUserProfile(User user, String originalEmail) throws SQLException {
        String sql = "UPDATE users SET first_name = ?, last_name = ?, user_name = ?, email = ?, password = ?, phone_number = ?, address = ?, role = ?, photo = ?, dob = ?, gender = ? WHERE email = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, user.getFirst_name());
            ps.setString(2, user.getLast_name());
            ps.setString(3, user.getUser_name());
            ps.setString(4, user.getEmail());
            ps.setString(5, encryptDecrypt.encrypt(user.getPassword())); // Encrypt password
            ps.setString(6, user.getPhone_number());
            ps.setString(7, user.getAddress());
            ps.setString(8, user.getRole());
            ps.setString(9, user.getPhoto());
            ps.setString(10, user.getDob());
            ps.setString(11, user.getGender());
            ps.setString(12, originalEmail);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error updating user profile:");
            e.printStackTrace();
            return false;
        }
    }

    // Validate user's current password
    public boolean validateCurrentPassword(String email, String inputPassword) throws SQLException {
        String sql = "SELECT password FROM users WHERE email = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String encrypted = rs.getString("password");
                    String decrypted = encryptDecrypt.decrypt(encrypted);
                    return decrypted.equals(inputPassword);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error validating current password:");
            e.printStackTrace();
        }

        return false;
    }

    // Get user by email and encrypted password (used during login)
    public User getUserByEmailAndPassword(String email, String encryptedPassword) throws SQLException {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, encryptedPassword);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUser(rs);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error in getting user by email and password:");
            e.printStackTrace();
        }

        return null;
    }

    // Update user password
    public boolean updatePassword(String email, String newPassword) throws SQLException {
        String sql = "UPDATE users SET password = ? WHERE email = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, encryptDecrypt.encrypt(newPassword)); // Encrypt before storing
            ps.setString(2, email);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error Changing password:");
            e.printStackTrace();
            return false;
        }
    }
    
    
    
    
    
    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM users";  // Use your actual table name
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new User(
                    rs.getInt("user_id"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("user_name"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("phone_number"),
                    rs.getString("address"),
                    rs.getString("role"),
                    rs.getString("photo"),
                    rs.getString("dob"),
                    rs.getString("gender")
                );
                userList.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }


 // Delete user by ID
    public boolean deleteUser(int userId) {
        String sql = "DELETE FROM users WHERE user_id = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            int count = ps.executeUpdate();
            System.out.println("Total no of deleted users: " + count);
            return count > 0;
        } catch (SQLException e) {
            System.out.println("Error deleting user with ID: " + userId);
            e.printStackTrace();
            return false;
        }
    }
    
}