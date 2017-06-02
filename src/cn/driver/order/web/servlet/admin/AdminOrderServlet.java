package cn.driver.order.web.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.driver.order.domain.Order;
import cn.driver.order.service.OrderException;
import cn.driver.order.service.OrderService;
import cn.itcast.servlet.BaseServlet;

public class AdminOrderServlet extends BaseServlet {

	OrderService orderService = new OrderService();

	/**
	 * 查询所有订单
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAll(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<Order> orderList = orderService.findAll();
		request.setAttribute("orderList", orderList);
		return "f:/adminjsps/admin/order/list.jsp";
	}

	/**
	 * 后台按订单状态查询订单
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findState(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int state=Integer.parseInt(request.getParameter("state"));
		
		List<Order> orderList = orderService.findState(state);
		request.setAttribute("orderList", orderList);
		return "f:/adminjsps/admin/order/list.jsp";
	}

	/**
	 * 后台管理员发货，按oid修改订单状态
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String fahuo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String oid = request.getParameter("oid");
		try {
			orderService.fahuo(oid);
			request.setAttribute("msg", "发货成功！");
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
		}
		return "f:/adminjsps/msg.jsp";
	}
}
