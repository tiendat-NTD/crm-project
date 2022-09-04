package duan_crm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import duan_crm.constant.Constants;
import duan_crm.dao.ProjectDAO;
import duan_crm.dao.StatusDAO;
import duan_crm.dao.TaskDAO;
import duan_crm.model.TaskModel;
import duan_crm.pojo.User;

@WebServlet(urlPatterns = {Constants.URL_TASK,Constants.URL_TASK_ADD,Constants.URL_TASK_EDIT,Constants.URL_TASK_DELETE,Constants.URL_TASK_GET_USER,Constants.URL_TASK_DETAILS})
public class TaskController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = req.getServletPath();
		User userLogin = (User) req.getSession().getAttribute(Constants.USER_LOGIN);
		switch (path) {
			case Constants.URL_TASK_DETAILS:
				req.setAttribute("list_project", ProjectDAO.getAllProject());
				TaskModel taskDetail = TaskDAO.getTaskById(Integer.parseInt(req.getParameter("id")));
				req.setAttribute("list_status", StatusDAO.getAllStatus());
				req.setAttribute("list_user", ProjectDAO.getUserByProjectId(taskDetail.getIdProject()));
				req.setAttribute("task_edit", taskDetail);
				req.getRequestDispatcher("/views/task/detail.jsp").forward(req, resp);
				break;
			case Constants.URL_TASK:
				if(userLogin.getRoleName().equals(Constants.ROLE_LEADER)) {
					req.setAttribute("list_task", TaskDAO.getAllTaskByLeader(userLogin.getId()));
				}else {
					req.setAttribute("list_task", TaskDAO.getAllTask());
				}
				req.getRequestDispatcher("/views/task/index.jsp").forward(req, resp);
				break;
			case Constants.URL_TASK_ADD:
				if(userLogin.getRoleName().equals(Constants.ROLE_LEADER)) {
					req.setAttribute("list_project", ProjectDAO.getAllProjectByUserId(userLogin.getId()));
				}else {
					req.setAttribute("list_project", ProjectDAO.getAllProject());
				}
				req.getRequestDispatcher("/views/task/add.jsp").forward(req, resp);
				break;
			case Constants.URL_TASK_EDIT:
				if(userLogin.getRoleName().equals(Constants.ROLE_LEADER)) {
					req.setAttribute("list_project", ProjectDAO.getAllProjectByUserId(userLogin.getId()));
				}else {
					req.setAttribute("list_project", ProjectDAO.getAllProject());
				}
				TaskModel taskEdit = TaskDAO.getTaskById(Integer.parseInt(req.getParameter("id")));
				req.setAttribute("list_status", StatusDAO.getAllStatus());
				req.setAttribute("list_user", ProjectDAO.getUserByProjectId(taskEdit.getIdProject()));
				req.setAttribute("task_edit", taskEdit);
				req.getRequestDispatcher("/views/task/edit.jsp").forward(req, resp);
				break;
			case Constants.URL_TASK_DELETE:
				TaskDAO.deleteTask(Integer.parseInt(req.getParameter("id")));
				resp.sendRedirect(req.getContextPath() + Constants.URL_TASK);
				break;
			default:
				break;
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = req.getServletPath();
		TaskModel task;
		resp.setCharacterEncoding("UTF-8");
		switch (path) {
		case Constants.URL_TASK_GET_USER:
			List<User> list = ProjectDAO.getUserByProjectId(Integer.parseInt(req.getParameter("id")));
			PrintWriter out=resp.getWriter();
			resp.setContentType("application/json");
			Gson gson = new Gson();
			String objectToReturn="";
			objectToReturn = gson.toJson(list);
			out.write(objectToReturn);// Dua Json tra về Ajax
			out.flush();
			return;
		case Constants.URL_TASK_ADD:
			task = new TaskModel();
			
			task.setTaskName(req.getParameter("task_name"));
			task.setIdProject(Integer.parseInt(req.getParameter("project")));
			task.setIdUser(Integer.parseInt(req.getParameter("user_id")));
			task.setStartDate(req.getParameter("startdate"));
			task.setEndDate(req.getParameter("enddate"));
			task.setDescription(req.getParameter("description"));
			task.setIdStatus(1);//mới tạo là chưa bắt đầu
		
			TaskDAO.addTask(task);
			resp.sendRedirect(req.getContextPath() + Constants.URL_TASK);
			break;
		case Constants.URL_TASK_EDIT:
			task = new TaskModel();
			
			task.setId(Integer.parseInt(req.getParameter("id")));
			task.setTaskName(req.getParameter("task_name"));
			task.setIdUser(Integer.parseInt(req.getParameter("user_id")));
			task.setStartDate(req.getParameter("startdate"));
			task.setEndDate(req.getParameter("enddate"));
			task.setDescription(req.getParameter("description"));
			task.setIdStatus(Integer.parseInt(req.getParameter("status_id")));
		
			TaskDAO.editTask(task);
			resp.sendRedirect(req.getContextPath() + Constants.URL_TASK);
			break;
		default:
			break;
	}
	}
}
