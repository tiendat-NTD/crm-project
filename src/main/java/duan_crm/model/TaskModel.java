package duan_crm.model;

public class TaskModel {
	private int id;
	private String taskName;
	private String description;
	private String startDate;
	private String endDate;
	private int idUser;
	private int idProject;
	private int idStatus;
	
	public TaskModel() {
		// TODO Auto-generated constructor stub
	}
	
	public TaskModel(int id, String taskName, String description, String startDate, String endDate, int idUser, int idProject, int idStatus) {
		// TODO Auto-generated constructor stub
		this.id = id;
		this.taskName = taskName;
		this.description = description;
		this.startDate = startDate;
		this.endDate = endDate;
		this.idUser = idUser;
		this.idProject = idProject;
		this.idStatus = idStatus;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public int getIdProject() {
		return idProject;
	}

	public void setIdProject(int idProject) {
		this.idProject = idProject;
	}

	public int getIdStatus() {
		return idStatus;
	}

	public void setIdStatus(int idStatus) {
		this.idStatus = idStatus;
	}
}
