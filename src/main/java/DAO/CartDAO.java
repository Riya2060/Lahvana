package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import database.DatabaseConnection;
import model.CartItem;

public class CartDAO {
    private Connection con;

    public CartDAO() throws SQLException, ClassNotFoundException {
        con = DatabaseConnection.getConnection();
    }

    // Get or create cart by user_id
    public int getOrCreateCartByUserId(int user_id) throws SQLException {
        String selectQuery = "SELECT cart_id FROM cart WHERE user_id = ?";
        try (PreparedStatement ps = con.prepareStatement(selectQuery)) {
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt("cart_id");
        }

        // create cart if not exist
        String insertQuery = "INSERT INTO cart (user_id, cart_total_amount) VALUES (?, 0)";
        try (PreparedStatement ps = con.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, user_id);
            ps.executeUpdate();
            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) return keys.getInt(1);
        }
        return -1;
    }

    // Add product or update quantity in cart
    public void addToCart(int cart_id, int product_id, int quantity) throws SQLException {
        String selectQuery = "SELECT quantity FROM cart_product WHERE cart_id = ? AND product_id = ?";
        try (PreparedStatement ps = con.prepareStatement(selectQuery)) {
            ps.setInt(1, cart_id);
            ps.setInt(2, product_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int existingQty = rs.getInt("quantity");
                int newQty = existingQty + quantity;
                String updateQuery = "UPDATE cart_product SET quantity = ? WHERE cart_id = ? AND product_id = ?";
                try (PreparedStatement ps2 = con.prepareStatement(updateQuery)) {
                    ps2.setInt(1, newQty);
                    ps2.setInt(2, cart_id);
                    ps2.setInt(3, product_id);
                    ps2.executeUpdate();
                }
            } else {
                String insertQuery = "INSERT INTO cart_product (cart_id, product_id, quantity) VALUES (?, ?, ?)";
                try (PreparedStatement ps2 = con.prepareStatement(insertQuery)) {
                    ps2.setInt(1, cart_id);
                    ps2.setInt(2, product_id);
                    ps2.setInt(3, quantity);
                    ps2.executeUpdate();
                }
            }
        }
    }

    // Update total amount in cart table
    public void updateCartTotalAmount(int cart_id) throws SQLException {
        String query = "UPDATE cart SET cart_total_amount = (SELECT SUM(p.price * cp.quantity) FROM cart_product cp JOIN products p ON cp.product_id = p.product_id WHERE cp.cart_id = ?) WHERE cart_id = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, cart_id);
            ps.setInt(2, cart_id);
            ps.executeUpdate();
        }
    }

    // Get cart items by user_id
    public List<CartItem> getCartItemsByUserId(int user_id) throws SQLException {
        List<CartItem> cartItems = new ArrayList<>();

        // Get the cart_id for the user
        int cart_id = getOrCreateCartByUserId(user_id);
        if (cart_id == -1) {
            return cartItems;  // return empty list if no cart found
        }

        String query = "SELECT cp.product_id, p.product_name, p.image_path, p.price, cp.quantity " +
                       "FROM cart_product cp JOIN products p ON cp.product_id = p.product_id " +
                       "WHERE cp.cart_id = ?";

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, cart_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                String imagePath = rs.getString("image_path");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");

                CartItem item = new CartItem(productId, productName, imagePath, price, quantity);
                cartItems.add(item);
            }
        }

        return cartItems;
    }
}
