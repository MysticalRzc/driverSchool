package cn.driver.order.service;

import java.sql.SQLException;
import java.util.List;

import cn.driver.order.dao.OrderDao;
import cn.driver.order.domain.Order;
import cn.itcast.jdbc.JdbcUtils;

public class OrderService {
	private OrderDao orderDao = new OrderDao();

	/**
	 * 添加订单 需要处理事务
	 * 
	 * @param order
	 */
	public void add(Order order) {
		try {
			// 开启事务
			JdbcUtils.beginTransaction();

			orderDao.addOrder(order);// 插入订单
			orderDao.addOrderItemList(order.getOrderItemList());// 插入订单中的所有条目

			// 提交事务
			JdbcUtils.commitTransaction();
		} catch (Exception e) {
			// 回滚事务
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {
			}
			throw new RuntimeException(e);
		}
	}

	/**
	 * 我的订单
	 * 
	 * @param uid
	 * @return
	 */
	public List<Order> myOrders(String uid) {
		return orderDao.findByUid(uid);
	}

	/**
	 * 加载订单
	 * 
	 * @param oid
	 * @return
	 */
	public Order load(String oid) {
		return orderDao.load(oid);
	}

	/**
	 * 确认收货
	 * 
	 * @param oid
	 * @throws OrderException
	 */
	public void confirm(String oid) throws OrderException {
		/*
		 * 1. 校验订单状态，如果不是3，抛出异常
		 */
		int state = orderDao.getStateByOid(oid);// 获取订单状态
		if (state != 3)
			throw new OrderException("订单确认失败！");

		/*
		 * 2. 修改订单状态为4，表示交易成功
		 */
		orderDao.updateState(oid, 4);
	}

	public List<Order> delete(String oid,String uid) {
		// TODO Auto-generated method stub
		return orderDao.deleteOid(oid,uid);
	}

	/**
	 * 支付方法
	 * @param oid
	 */
	public void zhiFu(String oid) {
		/*
		 * 1. 获取订单的状态
		 *   * 如果状态为1，那么执行下面代码
		 *   * 如果状态不为1，那么本方法什么都不做
		 */
		int state = orderDao.getStateByOid(oid);
		if(state == 1) {
			// 修改订单状态为2
			orderDao.updateState(oid, 2);
		}
	}

	/**
	 * 后台查询所有订单
	 * @return
	 */
	public List<Order> findAll() {
		return orderDao.findAll();
	}
	
	/**
	 * 后台按订单状态查询订单
	 * @return
	 */
	public List<Order> findState(int state) {
		return orderDao.findState(state);
	}

	/**
	 * 后台按订单号修改订单状态
	 * @param oid
	 */
	public void fahuo(String oid) {
		int state = orderDao.getStateByOid(oid);
		if(state == 2) {
			// 修改订单状态为2
			orderDao.updateState(oid, 3);
		}
	}
}
