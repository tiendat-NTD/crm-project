package duan_crm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import duan_crm.constant.Constants;
import duan_crm.dao.Function;
import duan_crm.dao.ProfileDAO;
import duan_crm.dao.ProjectDAO;
import duan_crm.dao.StatusDAO;
import duan_crm.dao.TaskDAO;
import duan_crm.dao.UserDAO;
import duan_crm.model.TaskModel;
import duan_crm.model.UserModel;
import duan_crm.pojo.Task;
import duan_crm.pojo.User;

@WebServlet(urlPatterns = {Constants.URL_PROFILE,Constants.URL_PROFILE_TASK, Constants.URL_PROFILE_TASK_UPDATE})
public class ProfileController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User userLogin = (User) req.getSession().getAttribute(Constants.USER_LOGIN);
		String path = req.getServletPath();
		switch (path) {
			case Constants.URL_PROFILE:
				req.setAttribute("user_edit", UserDAO.getUserById(userLogin.getId()));
				req.getRequestDispatcher("/views/profile/index.jsp").forward(req, resp);
				break;
			case Constants.URL_PROFILE_TASK:
				req.setAttribute("user_detail", UserDAO.getUserById(userLogin.getId()));
				
				List<Task> taskListWithUserId = TaskDAO.getAllTaskOfUserId(userLogin.getId());
				req.setAttribute("task_list", taskListWithUserId);
				
				req.setAttribute("task_chua_bat_dau", TaskDAO.getNumberOfStatus(taskListWithUserId,1));
				req.setAttribute("task_dang_thuc_hien", TaskDAO.getNumberOfStatus(taskListWithUserId,2));
				req.setAttribute("task_da_hoan_thanh", TaskDAO.getNumberOfStatus(taskListWithUserId,3));
				
				req.getRequestDispatcher("/views/profile/task.jsp").forward(req, resp);
				break;	
			case Constants.URL_PROFILE_TASK_UPDATE:
				req.setAttribute("list_project", ProjectDAO.getAllProject());
				TaskModel taskEdit = TaskDAO.getTaskById(Integer.parseInt(req.getParameter("id")));
				req.setAttribute("list_status", StatusDAO.getAllStatus());
				req.setAttribute("list_user", ProjectDAO.getUserByProjectId(taskEdit.getIdProject()));
				req.setAttribute("task_edit", taskEdit);
				req.getRequestDispatcher("/views/profile/edit.jsp").forward(req, resp);
				break;
			default:
				break;
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = req.getServletPath();
		UserModel user;
		TaskModel task;
		switch (path) {
			case Constants.URL_PROFILE:
				user = new UserModel();
				user.setId(Integer.parseInt(req.getParameter("id")));
				user.setEmail(req.getParameter("email"));
				user.setFullName(req.getParameter("fullname"));

				if(req.getParameter("password") != "") {
					String hasheds = Function.getMd5(req.getParameter("password"));
					
					user.setPassword(hasheds);
				}
				user.setAddress(req.getParameter("address"));
				user.setPhoneNumber(req.getParameter("phone"));
				
				ProfileDAO.editUser(user);
				
				if(req.getParameter("password") != "") {
					req.setAttribute("msg_error", "Vui lòng đăng nhập lại!");
					resp.sendRedirect(req.getContextPath() + Constants.URL_LOGOUT);
				}else {
					resp.sendRedirect(req.getContextPath() + Constants.URL_PROFILE);
				}
				break;
			case Constants.URL_PROFILE_TASK_UPDATE:
				task = new TaskModel();
				
				task.setId(Integer.parseInt(req.getParameter("id")));
				task.setTaskName(req.getParameter("task_name"));
				task.setIdUser(Integer.parseInt(req.getParameter("user_id")));
				task.setStartDate(req.getParameter("startdate"));
				task.setEndDate(req.getParameter("enddate"));
				task.setDescription(req.getParameter("description"));
				task.setIdStatus(Integer.parseInt(req.getParameter("status_id")));
			
				TaskDAO.editTask(task);
				resp.sendRedirect(req.getContextPath() + Constants.URL_PROFILE_TASK);
				break;
			default:
				break;
		}
	}
}
