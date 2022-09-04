package duan_crm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import duan_crm.connection.MySqlConnection;
import duan_crm.model.UserModel;

public class ProfileDAO {

	public static void editUser(UserModel user) {
		// TODO Auto-generated method stub
		try {
			String query;
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement;
			
			if(user.getPassword() != null) {
				query = "UPDATE users SET email = ?, full_name = ?, address = ?, phone_number = ?, password = ? WHERE id = ?";
				
				statement = connection.prepareStatement(query);
				
				statement.setString(1, user.getEmail());
				statement.setString(2, user.getFullName());
				statement.setString(3, user.getAddress());
				statement.setString(4, user.getPhoneNumber());
				statement.setString(5, user.getPassword());
				statement.setInt(6, user.getId());
				
				int result = statement.executeUpdate();
				
				if(result < 1) {
					System.out.println("Edit fail!");
				}
			}else{
				query = "UPDATE users SET email = ?, full_name = ?, address = ?, phone_number = ? WHERE id = ?";
				statement = connection.prepareStatement(query);
				
				statement.setString(1, user.getEmail());
				statement.setString(2, user.getFullName());
				statement.setString(3, user.getAddress());
				statement.setString(4, user.getPhoneNumber());
				statement.setInt(5, user.getId());

				int result = statement.executeUpdate();
				
				if(result < 1) {
					System.out.println("Edit fail!");
				}
			}
			
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
