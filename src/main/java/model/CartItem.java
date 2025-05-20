package model;

public class CartItem {
	private int productId;
	private String productName;
    private String imagePath;
    private double price;
    private int quantity;

    public CartItem(int productId,String productName, String imagePath, double price, int quantity) {
    	this.productId = productId;
        this.productName = productName;
        this.imagePath = imagePath;
        this.price = price;
        this.quantity = quantity;
    }

    // Getters
    public int getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public String getImagePath() {
        return imagePath;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }
}

