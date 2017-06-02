package cn.driver.test.web.servlet.admin;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.driver.test.daomain.Tests;
import cn.driver.test.service.ClothesService;
import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class AdminClothesServlet extends BaseServlet {

	private ClothesService clothesService = new ClothesService();
	
	public String load(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 获取参数cid，通过cid调用service方法得到Clothes对象
		 * 2. 获取所有衣服，保存到request域中
		 * 3. 保存clothes到request域中，转发到desc.jsp
		 */
		request.setAttribute("clothes", clothesService.load(request.getParameter("cid")));
		return "f:/adminjsps/admin/clothes/desc.jsp";
	}
	
	/**
	 * 查看所有衣服
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("clothesList", clothesService.findAll());
		return "f:/adminjsps/admin/clothes/list.jsp";
	}
	
	/**
	 * 删除衣服
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cid = request.getParameter("cid");
		clothesService.delete(cid);
		return findAll(request, response);
	}
	
	/**
	 * 修改衣服
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Tests tests = CommonUtils.toBean(request.getParameterMap(), Tests.class);
		clothesService.edit(tests);
		return findAll(request, response);
	}
}
