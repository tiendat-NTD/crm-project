package duan_crm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import duan_crm.constant.Constants;
import duan_crm.dao.ProjectDAO;
import duan_crm.dao.StatusDAO;
import duan_crm.dao.TaskDAO;
import duan_crm.dao.UserDAO;
import duan_crm.model.ProjectModel;
import duan_crm.pojo.Task;
import duan_crm.pojo.User;

@WebServlet(urlPatterns = {Constants.URL_PROJECT, Constants.URL_PROJECT_ADD,Constants.URL_PROJECT_EDIT,Constants.URL_PROJECT_DELETE,Constants.URL_PROJECT_DETAILS,Constants.URL_PROJECT_MANAGER,Constants.URL_PROJECT_MANAGER_DELETE})
public class ProjectController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = req.getServletPath();
		switch (path) {
			case Constants.URL_PROJECT_DETAILS:
				List<Task> taskListWithProject = TaskDAO.getAllTaskOfProject(Integer.parseInt(req.getParameter("id")));
				req.setAttribute("task_list", taskListWithProject);
				
				req.setAttribute("task_chua_bat_dau", TaskDAO.getNumberOfStatus(taskListWithProject,1));
				req.setAttribute("task_dang_thuc_hien", TaskDAO.getNumberOfStatus(taskListWithProject,2));
				req.setAttribute("task_da_hoan_thanh", TaskDAO.getNumberOfStatus(taskListWithProject,3));
				
				req.setAttribute("list_user_of_project", ProjectDAO.getUserByProjectId(Integer.parseInt(req.getParameter("id"))));
				req.getRequestDispatcher("/views/project/detail.jsp").forward(req, resp);
				break;
			case Constants.URL_PROJECT:
				User userLogin = (User) req.getSession().getAttribute(Constants.USER_LOGIN);
				if(userLogin.getRoleName().equals(Constants.ROLE_LEADER)) {
					req.setAttribute("list_project", ProjectDAO.getAllProjectByUserId(userLogin.getId()));
				}else {
					req.setAttribute("list_project", ProjectDAO.getAllProject());
				}
				req.getRequestDispatcher("/views/project/index.jsp").forward(req, resp);
				break;
			case Constants.URL_PROJECT_ADD:
				req.setAttribute("list_project", ProjectDAO.getAllProject());
				req.setAttribute("list_user", UserDAO.getUserByRole(Constants.ROLE_LEADER));
				req.getRequestDispatcher("/views/project/add.jsp").forward(req, resp);
				break;
			case Constants.URL_PROJECT_EDIT:
				req.setAttribute("list_status", StatusDAO.getAllStatus());
				req.setAttribute("list_user", UserDAO.getUserByRole(Constants.ROLE_LEADER));
				req.setAttribute("project_edit", ProjectDAO.getProjectById(Integer.parseInt(req.getParameter("id"))));
				req.getRequestDispatcher("/views/project/edit.jsp").forward(req, resp);
				break;
			case Constants.URL_PROJECT_DELETE:
				ProjectDAO.removeProjectById(Integer.parseInt(req.getParameter("id")));
				resp.sendRedirect(req.getContextPath() + Constants.URL_PROJECT);
				break;
			case Constants.URL_PROJECT_MANAGER:
				//xử lý lấy nhưng user chưa thuộc dự án trước
				List<User> listKQ = new ArrayList<User>();
				List<User> listUsers = UserDAO.getUserByRole(Constants.ROLE_MEMBER);
				for (User user : listUsers) {
					if(!ProjectDAO.checkUserOfProject(Integer.parseInt(req.getParameter("id")), user.getId())) {
						listKQ.add(user);
					}
				}
				req.setAttribute("list_user", listKQ);
				req.setAttribute("list_user_of_project", ProjectDAO.getUserByProjectId(Integer.parseInt(req.getParameter("id"))));
				req.setAttribute("id_project", Integer.parseInt(req.getParameter("id")));
				req.getRequestDispatcher("/views/project/manager.jsp").forward(req, resp);
				break;
			case Constants.URL_PROJECT_MANAGER_DELETE:
				int project_id = (Integer.parseInt(req.getParameter("id_project")));
				int user_id = (Integer.parseInt(req.getParameter("id_user")));
				
				ProjectDAO.removeUserOfProject(project_id, user_id);
				resp.sendRedirect(req.getContextPath() + Constants.URL_PROJECT_MANAGER + "?id=" + project_id);
				break;
			default:
				break;
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = req.getServletPath();
		ProjectModel pro;
		
		switch (path) {
			case Constants.URL_PROJECT_ADD:
				pro = new ProjectModel();
				
				pro.setProjectName(req.getParameter("project_name"));
				pro.setDescription(req.getParameter("project_des"));
				pro.setStartDate(req.getParameter("project_start"));
				pro.setEndDate(req.getParameter("project_end"));
				pro.setIdUser(Integer.parseInt(req.getParameter("project_user")));
				
				ProjectDAO.addNewProject(pro);
				resp.sendRedirect(req.getContextPath() + Constants.URL_PROJECT);
				break;
			case Constants.URL_PROJECT_EDIT:
				pro = new ProjectModel();
				
				pro.setId(Integer.parseInt(req.getParameter("id")));
				pro.setProjectName(req.getParameter("project_name"));
				pro.setDescription(req.getParameter("project_des"));
				pro.setStartDate(req.getParameter("project_start"));
				pro.setEndDate(req.getParameter("project_end"));
				pro.setIdUser(Integer.parseInt(req.getParameter("project_user")));
				pro.setIdStatus(Integer.parseInt(req.getParameter("project_status")));
				
				ProjectDAO.editProject(pro);
				resp.sendRedirect(req.getContextPath() + Constants.URL_PROJECT);
				break;
			case Constants.URL_PROJECT_MANAGER:
				int id_project = (Integer.parseInt(req.getParameter("id")));
				int id_user = (Integer.parseInt(req.getParameter("add_user")));
				
				ProjectDAO.addUserOfProject(id_project, id_user);
				resp.sendRedirect(req.getContextPath() + Constants.URL_PROJECT_MANAGER + "?id=" + id_project);
				break;
			default:
				break;
		}
	}
}
