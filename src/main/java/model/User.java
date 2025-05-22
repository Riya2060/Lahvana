package model;

public class User {
	private int user_id;
    private String first_name;
    private String last_name;
    private String user_name;
    private String email;
    private String password;
    private String phone_number;
    private String address;
    private String role;
    private String photo;
    private String dob;
    private String gender;
    
	public User(int user_id, String first_name, String last_name, String user_name, String email, String password,
			String phone_number, String address, String role, String photo, String dob, String gender) {
		super();
		this.user_id = user_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.user_name = user_name;
		this.email = email;
		this.password = password;
		this.phone_number = phone_number;
		this.address = address;
		this.role = role;
		this.photo = photo;
		this.dob = dob;
		this.gender = gender;
	}
	public int getId() {
		return user_id;
	}
	public void setId(int id) {
		this.user_id = id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
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
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
}