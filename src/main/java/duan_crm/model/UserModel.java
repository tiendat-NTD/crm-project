package duan_crm.model;

public class UserModel {
	private int id;
	private String fullName;
	private String email;
	private String address;
	private String password;
	private String phoneNumber;
	private int roleId;
	
	public UserModel() {
		
	}
	
	public UserModel(int id, String fullName, String email, String address, String password, String phoneNumber, int roleId) {
		this.id = id;
		this.fullName = fullName;
		this.address = address;
		this.email = email;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.roleId = roleId;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
}
