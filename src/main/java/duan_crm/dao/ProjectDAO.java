package duan_crm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import duan_crm.connection.MySqlConnection;
import duan_crm.model.ProjectModel;
import duan_crm.model.RoleModel;
import duan_crm.model.TaskModel;
import duan_crm.model.UserModel;
import duan_crm.pojo.User;

public class ProjectDAO {

	public static List<ProjectModel> getAllProject() {
		// TODO Auto-generated method stub
		List<ProjectModel> allProject = new ArrayList<ProjectModel>();
		try {
			String query = "SELECT * FROM projects";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			ResultSet result = statement.executeQuery();
			
			while (result.next()) {
				ProjectModel project = new ProjectModel(result.getInt("id"),result.getString("project_name"),result.getString("description"),
						result.getString("start_date"),result.getString("end_date"),
						result.getInt("id_user"),result.getInt("id_status"));
				
				allProject.add(project);
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return allProject;
	}

	public static int getNumberOfStatus(List<ProjectModel> projectList, int id) {
		// TODO Auto-generated method stub
		int dem = 0;
		for (ProjectModel project : projectList) {
			if(project.getIdStatus() == id) {
				dem++;
			}
		}
		return dem;
	}
	
	public static ProjectModel getProjectById(int id) {
		try {
			String query = "SELECT * FROM projects WHERE id = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setInt(1, id);
			
			ResultSet result = statement.executeQuery();
			
			if(result.next()) {
				ProjectModel project = new ProjectModel();
				project.setId(result.getInt("id"));
				project.setProjectName(result.getString("project_name"));
				project.setDescription(result.getString("description"));
				project.setStartDate(result.getString("start_date"));
				project.setEndDate(result.getString("end_date"));
				project.setIdUser(result.getInt("id_user"));
				project.setIdStatus(result.getInt("id_status"));
				
				return project;
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public static void addNewProject(ProjectModel pro) {
		// TODO Auto-generated method stub
		try {
			String query = "INSERT INTO projects (project_name, description, start_date, end_date, id_user, id_status) VALUES (?, ?, ?, ?, ?, ?)";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setString(1, pro.getProjectName());
			statement.setString(2, pro.getDescription());
			statement.setString(3, pro.getStartDate());
			statement.setString(4, pro.getEndDate());
			statement.setInt(5, pro.getIdUser());
			statement.setInt(6, 1);//mới tạo nên là chưa bắt đầu
			
			//System.out.println(query);
			
			int result = statement.executeUpdate();
			
			if(result < 1) {
				System.out.println("Add fail");
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static void editProject(ProjectModel pro) {
		// TODO Auto-generated method stub
		try {
			String query = "UPDATE projects SET project_name = ?, description = ?, start_date = ?, end_date = ?, id_user = ?, id_status = ? WHERE id = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setString(1, pro.getProjectName());
			statement.setString(2, pro.getDescription());
			statement.setString(3, pro.getStartDate());
			statement.setString(4, pro.getEndDate());
			statement.setInt(5, pro.getIdUser());
			statement.setInt(6, pro.getIdStatus());
			statement.setInt(7, pro.getId());
			
			
			int result = statement.executeUpdate();
			if(result < 1) {
				System.out.println("Edit fail");
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static void removeProjectById(int id) {
		// TODO Auto-generated method stub
		try {
			//xoá project
			String query = "DELETE FROM projects WHERE id = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setInt(1, id);
			
			int result = statement.executeUpdate();
			if(result < 1) {
				System.out.println("Delete fail!");
			}
			//xoá user thuộc project
			String query2 = "DELETE FROM projects_detail WHERE id_project = ?";
			statement = connection.prepareStatement(query2);
			
			statement.setInt(1, id);
			
			int result2 = statement.executeUpdate();
			if(result2 < 1) {
				System.out.println("Delete fail!");
			}
			//xoá task của project
			//xoá user thuộc project
			String query3 = "DELETE FROM tasks WHERE id_project = ?";
			statement = connection.prepareStatement(query3);
			
			statement.setInt(1, id);
			
			int result3 = statement.executeUpdate();
			if(result3 < 1) {
				System.out.println("Delete fail!");
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static List<User> getUserByProjectId(int id) {
		// TODO Auto-generated method stub
		List<User> listUser = new ArrayList<User>();
		try {
			String query = "SELECT * FROM project_detail WHERE id_project = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, id);
			
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				User user = UserDAO.getUserById(result.getInt("id_user"));
				
				listUser.add(user);
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();;
		}
		return listUser;
	}

	public static boolean checkUserOfProject(int id_project, int id_user) {
		// TODO Auto-generated method stub
		boolean kqua = false;
		try {
			String query = "SELECT * FROM project_detail WHERE id_project = ? AND id_user = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, id_project);
			statement.setInt(2, id_user);
			
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				kqua = true;
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();;
		}
		return kqua;
	}

	public static void addUserOfProject(int id_project, int id_user) {
		// TODO Auto-generated method stub
		try {
			String query = "INSERT INTO project_detail (id_project, id_user) VALUES (?, ?)";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setInt(1, id_project);
			statement.setInt(2, id_user);
		
			int result = statement.executeUpdate();
			
			if(result < 1) {
				System.out.println("Add fail");
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public static void removeUserOfProject(int id_project, int id_user) {
		// TODO Auto-generated method stub
		try {
			//xoá ở ds nhân viên thuộc dự án
			String query = "DELETE FROM project_detail WHERE id_project = ? AND id_user = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setInt(1, id_project);
			statement.setInt(2, id_user);
		
			int result = statement.executeUpdate();
			
			if(result < 1) {
				System.out.println("Delete fail");
			}
			//set các task nv đó đang nhận của dự án thành null
			String query2 = "UPDATE tasks SET id_user = ? WHERE id_project = ? AND id_user = ?";
			statement = connection.prepareStatement(query2);
			
			statement.setString(1, null);
			statement.setInt(2, id_project);
			statement.setInt(3, id_user);
		
			int result2 = statement.executeUpdate();
			
			if(result2 < 1) {
				System.out.println("Delete fail");
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static Object getAllProjectByUserId(int id) {
		// TODO Auto-generated method stub
		List<ProjectModel> allProject = new ArrayList<ProjectModel>();
		try {
			String query = "SELECT * FROM projects WHERE id_user = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setInt(1, id);
			
			ResultSet result = statement.executeQuery();
			
			while (result.next()) {
				ProjectModel project = new ProjectModel(result.getInt("id"),result.getString("project_name"),result.getString("description"),
						result.getString("start_date"),result.getString("end_date"),
						result.getInt("id_user"),result.getInt("id_status"));
				
				allProject.add(project);
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return allProject;
	}

}
