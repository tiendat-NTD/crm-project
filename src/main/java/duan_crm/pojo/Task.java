package duan_crm.pojo;

public class Task {
	private int id;
	private String taskName;
	private String description;
	private String startDate;
	private String endDate;
	private String projectName;
	private int idStatus;
	private int idUser;
	
	public Task() {
		// TODO Auto-generated constructor stub
	}
	
	public Task(int id, String taskName, String description, String startDate, String endDate, String projectName, int idStatus, int idUser) {
		// TODO Auto-generated constructor stub
		this.id = id;
		this.taskName = taskName;
		this.description = description;
		this.startDate = startDate;
		this.endDate = endDate;
		this.projectName = projectName;
		this.idStatus = idStatus;
		this.idUser = idUser;
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

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public int getIdStatus() {
		return idStatus;
	}

	public void setIdStatus(int idStatus) {
		this.idStatus = idStatus;
	}

	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	
	
}
