package duan_crm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import duan_crm.connection.MySqlConnection;


import duan_crm.model.RoleModel;

public class RoleDAO {
	public static RoleModel getRoleById(int id) {
		try {
			String query = "SELECT * FROM roles WHERE id = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setInt(1, id);
			
			ResultSet result = statement.executeQuery();
			
			if(result.next()) {
				RoleModel role = new RoleModel();
				role.setId(result.getInt("id"));
				role.setRoleName(result.getString("role_name"));
				role.setDescription(result.getString("description"));
				
				return role;
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public static List<RoleModel> getAllRole() {
		// TODO Auto-generated method stub
		List<RoleModel> listRole = new ArrayList<RoleModel>();
		try {
			String query = "SELECT * FROM roles";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			
			while (result.next()) {
				RoleModel role = new RoleModel();
				role.setId(result.getInt("id"));
				role.setRoleName(result.getString("role_name"));
				role.setDescription(result.getString("description"));
				
				listRole.add(role);
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listRole;
	}

	public static void addNewRole(RoleModel role) {
		// TODO Auto-generated method stub
		try {
			String query = "INSERT INTO roles (role_name, description) VALUES (?, ?)";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setString(1, role.getRoleName());
			statement.setString(2, role.getDescription());
			
			int result = statement.executeUpdate();

			if(result < 1) {
				System.out.println("Add fail");
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}
	}
	
	public static void editRole(RoleModel role) {
		// TODO Auto-generated method stub
		try {
			String query = "UPDATE roles SET role_name = ?, description = ? WHERE id = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setString(1, role.getRoleName());
			statement.setString(2, role.getDescription());
			statement.setInt(3, role.getId());
			
			int result = statement.executeUpdate();
			
			if(result < 1) {
				System.out.println("Add fail");
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static void removeRoleById(int id) {
		// TODO Auto-generated method stub
		try {
			String query = "DELETE FROM roles WHERE id = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setInt(1, id);
			
			int result = statement.executeUpdate();
			if(result < 1) {
				System.out.println("Delete fail!");
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public static RoleModel getRoleByRoleName(String roleName) {
		try {
			String query = "SELECT * FROM roles WHERE role_name = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setString(1, roleName);
			
			ResultSet result = statement.executeQuery();
			
			if(result.next()) {
				RoleModel role = new RoleModel();
				role.setId(result.getInt("id"));
				role.setRoleName(result.getString("role_name"));
				role.setDescription(result.getString("description"));
				
				return role;
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
}
