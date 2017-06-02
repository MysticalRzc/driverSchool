package cn.driver.user.web.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.driver.cart.domain.Cart;
import cn.driver.info.daomain.Info;
import cn.driver.info.service.InfoService;
import cn.driver.user.domain.User;
import cn.driver.user.service.UserException;
import cn.driver.user.service.UserService;
import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class UserServlet extends BaseServlet {
	private UserService userService = new UserService();

	/**
	 * 退出功能
	 */
	public String quit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().invalidate();
		return "r:/index.jsp";
	}

	public String login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 封装表单数据到form中 
		 * 2. 输入校验 
		 * 3. 保存错误信息、form到request，转发到login.jsp 
		 * 4. 保存用户信息到session中，然后重定向到index.jsp
		 */
		User form = CommonUtils.toBean(request.getParameterMap(), User.class);
		Map<String, String> errors = new HashMap<String, String>();
		// 对验证码进行校验
		String sessionVerifyCode = (String) request.getSession().getAttribute(
				"session_vcode");
		String verifyCode = form.getVerifyCode();
		if (verifyCode == null || verifyCode.trim().isEmpty()) {
			errors.put("verifyCode", "验证码不能为空！");
		} else if (verifyCode.length() != 4) {
			errors.put("verifyCode", "验证码长度必须为4！");
		} else if (!verifyCode.equalsIgnoreCase(sessionVerifyCode)) {
			errors.put("verifyCode", "验证码错误！");
		}
		
			
		
		try {
			User user = userService.login(form);
			request.getSession().setAttribute("session_user", user);
			Info info =new InfoService().check(user.getUid());
			request.getSession().setAttribute("session_info", info);
			request.getSession().setAttribute("cart", new Cart());
			if (errors.size() > 0) {
				request.setAttribute("errors", errors);
				request.setAttribute("form", form);
				return "f:/jsps/user/login.jsp";
			}
		} catch (UserException e) {
			request.setAttribute("msg", e.getMessage());
			request.setAttribute("form", form);
			return "f:/jsps/user/login.jsp";
		}

		return "r:/index.jsp";
		
		
	}

	/**
	 * 注册功能
     */
	public String regist(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		User form = CommonUtils.toBean(request.getParameterMap(), User.class);
		// 补全
		form.setUid(CommonUtils.uuid());
		/*
		 * 输入校验 1. 创建一个Map，用来封装错误信息，其中key为表单字段名称，值为错误信息
		 */
		Map<String, String> errors = new HashMap<String, String>();
		/*
		 * 2. 获取form中的name、password、email进行校验
		 */
		String name = form.getName();
		if (name == null || name.trim().isEmpty()) {
			errors.put("username", "用户名不能为空！");
		} else if (name.length() < 3 || name.length() > 10) {
			errors.put("username", "用户名长度必须在3~10之间！");
		}

		String password = form.getPassword();
		if (password == null || password.trim().isEmpty()) {
			errors.put("password", "密码不能为空！");
		} else if (password.length() < 3 || password.length() > 10) {
			errors.put("password", "密码长度必须在3~10之间！");
		}
		System.out.println(form.getType());
		
		/*
		 * 3. 判断是否存在错误信息
		 */
		if (errors.size() > 0) {
			// 1. 保存错误信息
			// 2. 保存表单数据
			// 3. 转发到regist.jsp
			request.setAttribute("errors", errors);
			request.setAttribute("form", form);
			return "f:/jsps/user/register.jsp";
		}

		/*
		 * 调用service的regist()方法
		 */
		try {
			userService.regist(form);
		} catch (UserException e) {
			/*
			 * 1. 保存异常信息 2. 保存form 3. 转发到regist.jsp
			 */
			request.setAttribute("msg", e.getMessage());
			request.setAttribute("form", form);
			return "f:/jsps/user/register.jsp";
		}

		request.setAttribute("msg", "恭喜，注册成功！");
		return "f:/jsps/msg.jsp";

	}
}