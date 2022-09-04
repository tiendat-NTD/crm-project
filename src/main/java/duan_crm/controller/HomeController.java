package duan_crm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import duan_crm.constant.Constants;
import duan_crm.dao.ProjectDAO;
import duan_crm.dao.TaskDAO;
import duan_crm.model.ProjectModel;
import duan_crm.model.TaskModel;

@WebServlet(urlPatterns = {Constants.URL_HOME})
public class HomeController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<TaskModel> taskList =  TaskDAO.getAllTask();
		List<ProjectModel> projectList = ProjectDAO.getAllProject();
		
		req.setAttribute("task_list", taskList.size());
		req.setAttribute("project_list", projectList.size());
		
		req.setAttribute("task_chua_bat_dau", TaskDAO.getNumberOfStatus2(taskList,1));
		req.setAttribute("task_dang_thuc_hien", TaskDAO.getNumberOfStatus2(taskList,2));
		req.setAttribute("task_da_hoan_thanh", TaskDAO.getNumberOfStatus2(taskList,3));
		
		req.setAttribute("project_chua_bat_dau", ProjectDAO.getNumberOfStatus(projectList,1));
		req.setAttribute("project_dang_thuc_hien", ProjectDAO.getNumberOfStatus(projectList,2));
		req.setAttribute("project_da_hoan_thanh", ProjectDAO.getNumberOfStatus(projectList,3));
		
		req.getRequestDispatcher("/views/home/index.jsp").forward(req, resp);
	}
}
