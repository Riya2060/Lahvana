package model;

public class CartItem {
	 private int cartItemId; 
	private int productId;
	private String productName;
    private String imagePath;
    private double price;
    private int quantity;

    public CartItem(int cartItemId, int productId,String productName, String imagePath, double price, int quantity) {
    	this.productId = productId;
        this.productName = productName;
        this.imagePath = imagePath;
        this.price = price;
        this.quantity = quantity;
    }
    public CartItem() {}
    public int getCartItemId() {
        return cartItemId;
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
    public void setCartItemId(int cartItemId) {
        this.cartItemId = cartItemId;
    }

    public void setProductId(int productId) {
	this.productId = productId; 
	}
    public void setProductName(String productName) {
    	this.productName = productName; 
    	}
    public void setImagePath(String imagePath) { 
    	this.imagePath = imagePath; 
    	}
    public void setPrice(double price) {
    	this.price = price; 
    	}
    public void setQuantity(int quantity) {
    	this.quantity = quantity; 
    	}
}

