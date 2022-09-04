package duan_crm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import duan_crm.connection.MySqlConnection;
import duan_crm.model.RoleModel;
import duan_crm.model.StatusModel;
import duan_crm.pojo.User;

public class StatusDAO {
	public static Object getStatusById(int id) {
		// TODO Auto-generated method stub
		try {
			String query = "SELECT * FROM status WHERE id = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setInt(1, id);
			
			ResultSet result = statement.executeQuery();
			
			if(result.next()) {
				StatusModel status = new StatusModel();
				
				status.setId(result.getInt("id"));
				status.setStatusName(result.getString("status_name"));
				
				return status;
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public static List<StatusModel> getAllStatus() {
		// TODO Auto-generated method stub
		List<StatusModel> listStatus = new ArrayList<StatusModel>();
		try {
			String query = "SELECT * FROM status";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				StatusModel status = new StatusModel();
				
				status.setId(result.getInt("id"));
				status.setStatusName(result.getString("status_name"));
				
				listStatus.add(status);
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();;
		}
		return listStatus;
	}
}
