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
        System.out.println("Database connection established.");
    }

    // Get or create cart by user_id
    public int getOrCreateCartByUserId(int user_id) throws SQLException {
        System.out.println("Checking if cart exists for user_id: " + user_id);
        String selectQuery = "SELECT cart_id FROM cart WHERE user_id = ?";
        try (PreparedStatement ps = con.prepareStatement(selectQuery)) {
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int cartId = rs.getInt("cart_id");
                System.out.println("Existing cart found with cart_id: " + cartId);
                return cartId;
            }
        }

        // create cart if not exist
        String insertQuery = "INSERT INTO cart (user_id, cart_total_amount) VALUES (?, 0)";
        try (PreparedStatement ps = con.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, user_id);
            int rows = ps.executeUpdate();
            if (rows > 0) {
                ResultSet keys = ps.getGeneratedKeys();
                if (keys.next()) {
                    int newCartId = keys.getInt(1);
                    System.out.println("New cart created with cart_id: " + newCartId);
                    return newCartId;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error creating cart: " + e.getMessage());
            e.printStackTrace();
        }

        return -1;
    }

    // Add product or update quantity in cart
    public void addToCart(int cart_id, int product_id, int quantity) throws SQLException {
        System.out.println("Inside addToCart: cart_id = " + cart_id + ", product_id = " + product_id + ", quantity = " + quantity);
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
                    System.out.println("Updated cart_product: new quantity = " + newQty);
                }
            } else {
                String insertQuery = "INSERT INTO cart_product (cart_id, product_id, quantity) VALUES (?, ?, ?)";
                try (PreparedStatement ps2 = con.prepareStatement(insertQuery)) {
                    ps2.setInt(1, cart_id);
                    ps2.setInt(2, product_id);
                    ps2.setInt(3, quantity);
                    ps2.executeUpdate();
                    System.out.println("Inserted new product into cart_product.");
                }
            }
        } catch (SQLException e) {
            System.out.println("Error in addToCart: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Update total amount in cart table
    public void updateCartTotalAmount(int cart_id) throws SQLException {
        System.out.println("Updating cart_total_amount for cart_id: " + cart_id);
        String query = "UPDATE cart SET cart_total_amount = " +
                       "(SELECT SUM(p.price * cp.quantity) " +
                       "FROM cart_product cp " +
                       "JOIN products p ON cp.product_id = p.product_id " +
                       "WHERE cp.cart_id = ?) " +
                       "WHERE cart_id = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, cart_id);
            ps.setInt(2, cart_id);
            int rows = ps.executeUpdate();
            System.out.println("Cart total updated. Rows affected: " + rows);
        } catch (SQLException e) {
            System.out.println("Error updating cart total: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Get cart items by user_id
    public List<CartItem> getCartItemsByUserId(int userId) {
        List<CartItem> cartItems = new ArrayList<>();
        System.out.println("Fetching cart items for user_id: " + userId);

        String sql = "SELECT cp.quantity, p.product_id, p.name AS product_name, p.price, p.image " +
                     "FROM cart_product cp " +
                     "JOIN products p ON cp.product_id = p.product_id " +
                     "JOIN cart c ON cp.cart_id = c.cart_id " +
                     "WHERE c.user_id = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CartItem item = new CartItem();
                item.setProductId(rs.getInt("product_id"));
                item.setProductName(rs.getString("product_name"));
                item.setPrice(rs.getDouble("price"));
                item.setQuantity(rs.getInt("quantity"));
                item.setImagePath(rs.getString("image"));

                cartItems.add(item);
            }
            System.out.println("Loaded cart items: " + cartItems.size());
        } catch (SQLException e) {
            System.out.println("Error loading cart items: " + e.getMessage());
            e.printStackTrace();
        }

        return cartItems;
    }
    public boolean deleteCartItem(int cartItemId) {
        String query = "DELETE FROM cart_product WHERE cart_item_id = ?";
        try {
             PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cartItemId);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
