package com.batdongsan24h.controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.batdongsan24h.constant.SystemConstant;
import com.batdongsan24h.model.UserModel;
import com.batdongsan24h.service.impl.IRoleService;
import com.batdongsan24h.service.impl.IUserService;
import com.batdongsan24h.utils.FormUtil;
import com.batdongsan24h.utils.MessageUtil;

@WebServlet(urlPatterns = {"/admin-member"})
public class MemberController extends HttpServlet{
	
	@Inject
	private IRoleService roleService;
	
	@Inject
	private IUserService userService;

	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view = "";
		UserModel model = FormUtil.toModel(UserModel.class, req);
		if (model.getType().equals(SystemConstant.ADDNEW)) {
			req.setAttribute("roles", roleService.findAll());
			view = "views/admin/member/user-add.jsp";
		}else if (model.getType().equals(SystemConstant.LIST)) {
			req.setAttribute("listUser", userService.findAll());
			view = "views/admin/member/user-table.jsp";
		}
		MessageUtil.showMessage(req);
		req.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
