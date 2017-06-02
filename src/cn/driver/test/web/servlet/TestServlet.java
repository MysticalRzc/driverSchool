package cn.driver.test.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.driver.test.daomain.Tests;
import cn.driver.test.daomain.PageBean;
import cn.driver.test.service.ClothesService;
import cn.itcast.servlet.BaseServlet;

public class TestServlet extends BaseServlet {
	private ClothesService clothesService = new ClothesService();
	public String load(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 得到参数cid 2. 查询得到Clothes 3. 保存，转发到desc.jsp
		 */
		request.setAttribute("clothes",
				clothesService.load(request.getParameter("cid")));
		return "f:/jsps/test/desc.jsp";
	}

	public String findAll(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String url = getUrl(request);
		/*
		 * 1. 搞定当前页码：pc
		 */
		int pc = getPc(request);
		int ps = 8;// 每页记录数
		PageBean<Tests> pb = clothesService.findAll(pc, ps);
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "f:/jsps/test/list.jsp";
	}

	private String getUrl(HttpServletRequest requset) {
		String url = requset.getQueryString();
		/*
		 * url中有可能存在pc，这需要把pc截取下去，不要它！
		 */
		int index = url.lastIndexOf("&pc=");
		if (index == -1) {
			return url;
		}
		return url.substring(0, index);
	}

	/*
	 * 获取当前页码
	 */
	private int getPc(HttpServletRequest requset) {
		/*
		 * 1. 查看是否存在pc参数，如果存在，转换成int类型 
		 * 2. 如果不存在pc参数，返回1
		 */
		String pc = requset.getParameter("pc");
		if (pc != null && !pc.trim().isEmpty()) {
			return Integer.parseInt(pc);
		}
		return 1;
	}

	public String findCname(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String cname = request.getParameter("cname");
		List<Tests> clotheslist = clothesService.findCname(cname);
		request.setAttribute("clotheslist", clotheslist);
		return "f:/jsps/test/list.jsp";
	}

}
