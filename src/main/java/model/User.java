package model;

public class User {
	 private int user_id;
    private String first_name;
    private String last_name;
    private String email;
    private String password;
    private String address;
    private String role;
    // Constructor without user_id - for registration (new users)
    public User(String first_name, String last_name, String email, String password, String address, String role) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.password = password;
        this.address = address;
        this.role = role;
    }
	public User(int user_id,String first_name, String last_name, String email, String password, String address, String role) {
		super();
		this.user_id = user_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.password = password;
		this.address = address;
		this.role = role;
	}
	  public int getUser_id() {
	        return user_id;
	    }

	    public void setUser_id(int user_id) {
	        this.user_id = user_id;
	    }
	public String getFirstname() {
		return first_name;
	}
	public void setFirstname(String firstname) {
		this.first_name = firstname;
	}
	public String getLastname() {
		return last_name;
	}
	public void setLastname(String lastname) {
		this.last_name = lastname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

}