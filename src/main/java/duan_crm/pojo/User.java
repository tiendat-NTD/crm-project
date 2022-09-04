package duan_crm.pojo;

public class User {
	private int id;
	private String fullName;
	private String email;
	private String address;
	private String password;
	private String phoneNumber;
	private String roleName;
	private String roleDescription;
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(int id, String email, String address, String password, String fullname, String role_name,
			String role_description, String phone) {
		// TODO Auto-generated constructor stub
		this.id = id;
		this.address = address;
		this.email = email;
		this.fullName = fullname;
		this.password = password;
		this.roleName = role_name;
		this.roleDescription = role_description;
		this.phoneNumber = phone;
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
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleDescription() {
		return roleDescription;
	}
	public void setRoleDescription(String roleDescription) {
		this.roleDescription = roleDescription;
	}
}
