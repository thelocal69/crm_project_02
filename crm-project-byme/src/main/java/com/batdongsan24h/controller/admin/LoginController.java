package com.batdongsan24h.controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.batdongsan24h.model.UserModel;
import com.batdongsan24h.service.impl.IUserService;
import com.batdongsan24h.utils.FormUtil;
import com.batdongsan24h.utils.MessageUtil;
import com.batdongsan24h.utils.SessionUtil;

@WebServlet(urlPatterns = {"/login", "/logout"})
public class LoginController extends HttpServlet{
	
	@Inject
	private IUserService userService;

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String login = "/views/login.jsp";
		String action = req.getParameter("action");
		MessageUtil.showMessage(req);
		if (action != null && action.equals("logout")) {
			SessionUtil.getInstance().removeValue(req, "USERMODEL");
		}
		RequestDispatcher rd = req.getRequestDispatcher(login);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
			UserModel model = FormUtil.toModel(UserModel.class, req);
			model = userService.findEmailAndPassword(model.getEmail(), model.getPass());
				if (model != null) {
					SessionUtil.getInstance().putValue(req, "USERMODEL", model);
					resp.sendRedirect(req.getContextPath() + "/admin-home");
				} else {
					resp.sendRedirect(
							req.getContextPath() + "/login?message=email_password_invalid&alert=danger");
				}
		}
		
	}

