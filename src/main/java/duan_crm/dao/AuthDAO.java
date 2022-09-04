package duan_crm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import duan_crm.connection.MySqlConnection;
import duan_crm.model.UserModel;

public class AuthDAO {
	public static UserModel login(String email) {
		UserModel userModel = null;
		try {
			String query = "SELECT * FROM users WHERE email = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setString(1, email);
			
			ResultSet result = statement.executeQuery();
			
			if(result.next()) {
				userModel = new UserModel();
				userModel.setId(result.getInt("id"));
				userModel.setEmail(result.getString("email"));
				userModel.setPassword(result.getString("password"));
				userModel.setFullName(result.getString("full_name"));
				userModel.setAddress(result.getString("address"));
				userModel.setRoleId(result.getInt("role_id"));
				userModel.setPhoneNumber(result.getString("phone_number"));
			}
			connection.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error: " + e.getMessage());
		}
		return userModel;
	}
}
