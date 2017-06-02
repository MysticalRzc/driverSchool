package cn.driver.info.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.driver.info.daomain.Info;
import cn.driver.info.service.InfoService;
import cn.driver.user.domain.User;
import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class InfoServlet extends BaseServlet {
	private InfoService infoService = new InfoService();
	
	/**
	 * 获取session对象user
	 */
	public User user(HttpServletRequest request) throws ServletException,
			IOException {
		User user = (User) request.getSession().getAttribute("session_user");
		return user;
	}

	/**
	 * 接收表单表单
	 * 
	 */

	public String add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 封装表单
		Info form = CommonUtils.toBean(request.getParameterMap(), Info.class);

		form.setUid(user(request).getUid());
		infoService.add(form);
		request.setAttribute("form", form);
		return "f:/jsps/info/list.jsp";
	}

	/**
	 * 修改个人信息前显示已有信息
	 */

	public String check(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Info info = infoService.check(user(request).getUid());
		request.setAttribute("form", info);
		return "f:/jsps/info/process.jsp";
	}

	/**
	 * 修改个人信息
	 */
	public String update(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 封装表单
		Info form = CommonUtils.toBean(request.getParameterMap(), Info.class);

		form.setUid(user(request).getUid());
		infoService.update(form);
		request.setAttribute("form", form);
		return "f:/jsps/info/list.jsp";
	}

	/**
	 * 查看个人信息
	 * 
	 */

	public String enter(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Info info = infoService.check(user(request).getUid());
		// 判断是否有信息
		if (info == null) {
			request.setAttribute("add", "add");
			return "f:/jsps/info/process.jsp";
		} else {
			request.setAttribute("form", info);
			return "f:/jsps/info/list.jsp";
		}
	}
}
