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
import duan_crm.dao.RoleDAO;
import duan_crm.dao.TaskDAO;
import duan_crm.dao.UserDAO;
import duan_crm.model.TaskModel;
import duan_crm.model.UserModel;

@WebServlet(urlPatterns = {Constants.URL_USER, Constants.URL_USER_ADD,Constants.URL_USER_EDIT,Constants.URL_USER_DELETE,Constants.URL_USER_DETAILS})
public class UserController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = req.getServletPath();
		switch (path) {
			case Constants.URL_USER_DETAILS:
				if(req.getParameter("id") == null) {
					resp.sendRedirect(req.getContextPath() + Constants.URL_USER);
					break;
				}
				req.setAttribute("user_detail", UserDAO.getUserById(Integer.parseInt(req.getParameter("id"))));
				
				List<TaskModel> taskListWithUserId = TaskDAO.getAllTaskModelOfUserId(Integer.parseInt(req.getParameter("id")));
				req.setAttribute("task_list", taskListWithUserId);
				
				req.setAttribute("task_chua_bat_dau", TaskDAO.getNumberOfStatus2(taskListWithUserId,1));
				req.setAttribute("task_dang_thuc_hien", TaskDAO.getNumberOfStatus2(taskListWithUserId,2));
				req.setAttribute("task_da_hoan_thanh", TaskDAO.getNumberOfStatus2(taskListWithUserId,3));
				
				req.getRequestDispatcher("/views/user/detail.jsp").forward(req, resp);
				break;
			case Constants.URL_USER:
				req.setAttribute("list_user", UserDAO.getAllUser());
				req.getRequestDispatcher("views/user/index.jsp").forward(req, resp);
				break;
			case Constants.URL_USER_ADD:
				req.setAttribute("list_role", RoleDAO.getAllRole());
				req.getRequestDispatcher("/views/user/add.jsp").forward(req, resp);
				break;
			case Constants.URL_USER_EDIT:		
				req.setAttribute("user_edit", UserDAO.getUserById(Integer.parseInt(req.getParameter("id"))));
				req.setAttribute("list_role", RoleDAO.getAllRole());
				req.getRequestDispatcher("/views/user/edit.jsp").forward(req, resp);
				break;
			case Constants.URL_USER_DELETE:
				UserDAO.removeUserById(Integer.parseInt(req.getParameter("id")));
				resp.sendRedirect(req.getContextPath() + Constants.URL_USER);
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
		
		switch (path) {
		case Constants.URL_USER_ADD:
			user = new UserModel();
		
			user.setEmail(req.getParameter("email"));
			user.setFullName(req.getParameter("fullname"));
			
			String hashed = Function.getMd5(req.getParameter("password"));
			
			user.setPassword(hashed);
			user.setRoleId(Integer.parseInt(req.getParameter("role")));
			user.setAddress(req.getParameter("address"));
			user.setPhoneNumber(req.getParameter("phone"));
			
			UserDAO.addNewUser(user);
			
			resp.sendRedirect(req.getContextPath() + Constants.URL_USER);
			break;
		case Constants.URL_USER_EDIT:
			user = new UserModel();
			user.setId(Integer.parseInt(req.getParameter("id")));
			user.setEmail(req.getParameter("email"));
			user.setFullName(req.getParameter("fullname"));
			if(req.getParameter("password") != "") {
				String hasheds = Function.getMd5(req.getParameter("password"));
				
				user.setPassword(hasheds);
			}
			user.setRoleId(Integer.parseInt(req.getParameter("role")));
			user.setAddress(req.getParameter("address"));
			user.setPhoneNumber(req.getParameter("phone"));
			
			UserDAO.editUser(user);
			
			resp.sendRedirect(req.getContextPath() + Constants.URL_USER);
			break;
		default:
			break;
		}
	}
}
