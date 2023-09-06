package com.batdongsan24h.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.batdongsan24h.model.RoleModel;
import com.batdongsan24h.model.UserModel;
import com.batdongsan24h.service.RoleService;
import com.batdongsan24h.utils.HttpUtil;
import com.batdongsan24h.utils.SessionUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(urlPatterns = {"/api-admin-role"})
public class RoleApi extends HttpServlet{
	
	@Inject
	private RoleService roleService;

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		RoleModel addRole = HttpUtil.of(req.getReader()).toModel(RoleModel.class);
		addRole.setCreatedBy(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getUserName());
		addRole = roleService.save(addRole);
		mapper.writeValue(resp.getOutputStream(), addRole);
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		RoleModel updateRole = HttpUtil.of(req.getReader()).toModel(RoleModel.class);
		updateRole.setModifiedBy(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getUserName());
		updateRole = roleService.update(updateRole);
		mapper.writeValue(resp.getOutputStream(), updateRole);
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		RoleModel removeRole = HttpUtil.of(req.getReader()).toModel(RoleModel.class);
		roleService.deleteById(removeRole.getId());
		mapper.writeValue(resp.getOutputStream(), "{}");
	}
}
