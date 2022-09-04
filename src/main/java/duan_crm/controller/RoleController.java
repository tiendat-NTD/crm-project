package duan_crm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import duan_crm.constant.Constants;
import duan_crm.dao.RoleDAO;
import duan_crm.model.RoleModel;

@WebServlet(urlPatterns = {Constants.URL_ROLE, Constants.URL_ROLE_ADD,Constants.URL_ROLE_EDIT,Constants.URL_ROLE_DELETE})
public class RoleController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = req.getServletPath();
		switch (path) {
		case Constants.URL_ROLE:
			req.setAttribute("list_role", RoleDAO.getAllRole());
			req.getRequestDispatcher("views/role/index.jsp").forward(req, resp);
			break;
		case Constants.URL_ROLE_ADD:
			req.getRequestDispatcher("/views/role/add.jsp").forward(req, resp);
			break;
		case Constants.URL_ROLE_EDIT:		
			req.setAttribute("role_edit", RoleDAO.getRoleById(Integer.parseInt(req.getParameter("id"))));
			req.getRequestDispatcher("/views/role/edit.jsp").forward(req, resp);
			break;
		case Constants.URL_ROLE_DELETE:
			RoleDAO.removeRoleById(Integer.parseInt(req.getParameter("id")));
			resp.sendRedirect(req.getContextPath() + Constants.URL_ROLE);
			break;
		default:
			break;
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = req.getServletPath();
		RoleModel role;
		
		switch (path) {
		case Constants.URL_ROLE_ADD:
			role = new RoleModel();
			
			role.setRoleName(req.getParameter("rolename"));
			role.setDescription(req.getParameter("description"));
			
			RoleDAO.addNewRole(role);
			
			resp.sendRedirect(req.getContextPath() + Constants.URL_ROLE);
			break;
		case Constants.URL_ROLE_EDIT:
			role = new RoleModel();
			
			role.setId(Integer.parseInt(req.getParameter("id")));
			role.setRoleName(req.getParameter("rolename"));
			role.setDescription(req.getParameter("description"));
			
			RoleDAO.editRole(role);
			
			resp.sendRedirect(req.getContextPath() + Constants.URL_ROLE);
			break;
		default:
			break;
		}
	}
}
