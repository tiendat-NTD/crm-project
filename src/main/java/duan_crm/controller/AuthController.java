package duan_crm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import duan_crm.constant.Constants;
import duan_crm.dao.AuthDAO;
import duan_crm.dao.Function;
import duan_crm.dao.RoleDAO;
import duan_crm.model.RoleModel;
import duan_crm.pojo.User;
import duan_crm.model.UserModel;

@WebServlet(urlPatterns = {Constants.URL_LOGIN,Constants.URL_LOGOUT})
public class AuthController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = req.getServletPath();

		switch(path){
			case Constants.URL_LOGIN:
				if(req.getSession().getAttribute(Constants.USER_LOGIN) != null) {
					resp.sendRedirect(req.getContextPath() + Constants.URL_HOME);
					return;
				}
				req.getRequestDispatcher("views/auth/login.jsp").forward(req, resp);
				break;
			case Constants.URL_LOGOUT:
				HttpSession session = req.getSession();
				session.invalidate();
				resp.sendRedirect(req.getContextPath() + Constants.URL_LOGIN);
				break;
			default:
				break;
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		UserModel user = AuthDAO.login(email);
		String pass = Function.getMd5(password);
		
		if (user == null || !pass.equals(user.getPassword())) {
			req.setAttribute("msg_error", "Email không tồn tại hoặc mật khẩu không chính xác!");
			req.getRequestDispatcher("views/auth/login.jsp").forward(req, resp);
			return;
		}
		RoleModel role = RoleDAO.getRoleById(user.getRoleId());
		User userLogin = new User(user.getId(),user.getEmail(), user.getAddress()
				,user.getPassword(),user.getFullName(),role.getRoleName(),role.getDescription(),user.getPhoneNumber());
		
		HttpSession session = req.getSession();
		session.setAttribute(Constants.USER_LOGIN, userLogin);
		session.setMaxInactiveInterval(6000);
		
		resp.sendRedirect(req.getContextPath() + Constants.URL_HOME);
	}
}
