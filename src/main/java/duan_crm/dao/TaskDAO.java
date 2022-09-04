package duan_crm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import duan_crm.connection.MySqlConnection;
import duan_crm.model.ProjectModel;
import duan_crm.model.TaskModel;
import duan_crm.pojo.Task;

public class TaskDAO {
	public static List<TaskModel> getAllTask() {
		List<TaskModel> allTask = new ArrayList<TaskModel>();
		try {
			String query = "SELECT * FROM tasks";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			ResultSet result = statement.executeQuery();
			
			while (result.next()) {
				TaskModel task = new TaskModel(result.getInt("id"),result.getString("task_name"),result.getString("description"),
						result.getString("start_date"),result.getString("end_date"),
						result.getInt("id_user"),result.getInt("id_project"),result.getInt("id_status"));
				
				allTask.add(task);
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return allTask;
	}
	public static int getNumberOfStatus(List<Task> taskList, int id) {
		// TODO Auto-generated method stub
		int task = 0;
		for (Task taskModel : taskList) {
			if(taskModel.getIdStatus() == id) {
				task++;
			}
		}
		return task;
	}
	public static int getNumberOfStatus2(List<TaskModel> taskList, int id) {
		// TODO Auto-generated method stub
		int task = 0;
		for (TaskModel taskModel : taskList) {
			if(taskModel.getIdStatus() == id) {
				task++;
			}
		}
		return task;
	}
	
	public static List<Task> getAllTaskOfUserId(int id) {
		// TODO Auto-generated method stub
		List<Task> allTask = new ArrayList<Task>();
		try {
			String query = "SELECT * FROM tasks WHERE id_user = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setInt(1, id);
			
			ResultSet result = statement.executeQuery();
			
			while (result.next()) {
				ProjectModel project = ProjectDAO.getProjectById(result.getInt("id_project"));
				Task task = new Task(result.getInt("id"),result.getString("task_name"),result.getString("description"),
						result.getString("start_date"),result.getString("end_date"),
						project.getProjectName(),result.getInt("id_status"),id);
				
				allTask.add(task);
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return allTask;
	}
	
	public static List<TaskModel> getAllTaskModelOfUserId(int id) {
		// TODO Auto-generated method stub
		List<TaskModel> allTask = new ArrayList<TaskModel>();
		try {
			String query = "SELECT * FROM tasks WHERE id_user = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setInt(1, id);
			
			ResultSet result = statement.executeQuery();
			
			while (result.next()) {
				TaskModel task = new TaskModel(result.getInt("id"),result.getString("task_name"),result.getString("description"),
						result.getString("start_date"),result.getString("end_date"),
						result.getInt("id_user"),result.getInt("id_project"),result.getInt("id_status"));
				
				allTask.add(task);
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return allTask;
	}
	
	public static List<Task> getAllTaskOfProject(int id) {
		// TODO Auto-generated method stub
		List<Task> allTask = new ArrayList<Task>();
		try {
			String query = "SELECT * FROM tasks WHERE id_project = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setInt(1, id);
			
			ResultSet result = statement.executeQuery();
			
			while (result.next()) {
				ProjectModel project = ProjectDAO.getProjectById(result.getInt("id_project"));
				Task task = new Task(result.getInt("id"),result.getString("task_name"),result.getString("description"),
						result.getString("start_date"),result.getString("end_date"),
						project.getProjectName(),result.getInt("id_status"),result.getInt("id_user"));
				
				allTask.add(task);
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return allTask;
	}
	public static Object getAllTaskByLeader(int id) {
		// TODO Auto-generated method stub
		List<TaskModel> allTask = new ArrayList<TaskModel>();
		try {
			String query = "SELECT t.* FROM tasks t JOIN projects p ON t.id_project = p.id WHERE p.id_user = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setInt(1, id);
			
			ResultSet result = statement.executeQuery();
			
			while (result.next()) {
				TaskModel task = new TaskModel(result.getInt("id"),result.getString("task_name"),result.getString("description"),
						result.getString("start_date"),result.getString("end_date"),
						result.getInt("id_user"),result.getInt("id_project"),result.getInt("id_status"));
				
				allTask.add(task);
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return allTask;
	}
	public static void addTask(TaskModel task) {
		// TODO Auto-generated method stub
		try {
			String query = "INSERT INTO tasks (task_name, description, start_date, end_date, id_user, id_project, id_status) VALUES (?, ?, ?, ?, ?, ?, ?)";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setString(1, task.getTaskName());
			statement.setString(2, task.getDescription());
			statement.setString(3, task.getStartDate());
			statement.setString(4, task.getEndDate());
			statement.setInt(5, task.getIdUser());
			statement.setInt(6, task.getIdProject());
			statement.setInt(7, task.getIdStatus());
		
			int result = statement.executeUpdate();
			
			if(result < 1) {
				System.out.println("Add fail");
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public static TaskModel getTaskById(int id) {
		// TODO Auto-generated method stub
		try {
			String query = "SELECT * FROM tasks WHERE id = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setInt(1, id);
			
			ResultSet result = statement.executeQuery();
			
			if(result.next()) {
				TaskModel task = new TaskModel();
				
				task.setId(result.getInt("id"));
				task.setTaskName(result.getString("task_name"));
				task.setDescription(result.getString("description"));
				task.setStartDate(result.getString("start_date"));
				task.setEndDate(result.getString("end_date"));
				task.setIdUser(result.getInt("id_user"));
				task.setIdStatus(result.getInt("id_status"));
				task.setIdProject(result.getInt("id_project"));
				
				return task;
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public static void editTask(TaskModel task) {
		// TODO Auto-generated method stub
		try {
			String query = "UPDATE tasks SET task_name = ?, description = ?, start_date = ?, end_date = ?, id_user = ?, id_status = ? WHERE id = ?";
			Connection connection = MySqlConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setString(1, task.getTaskName());
			statement.setString(2, task.getDescription());
			statement.setString(3, task.getStartDate());
			statement.setString(4, task.getEndDate());
			statement.setInt(5, task.getIdUser());
			statement.setInt(6, task.getIdStatus());
			statement.setInt(7, task.getId());
			
			
			int result = statement.executeUpdate();
			if(result < 1) {
				System.out.println("Edit fail");
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public static void deleteTask(int id) {
		// TODO Auto-generated method stub
		try {
			String query = "DELETE FROM tasks WHERE id = ?";
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
}
