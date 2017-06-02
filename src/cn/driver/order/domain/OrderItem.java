package cn.driver.order.domain;

import cn.driver.test.daomain.Tests;


public class OrderItem {
	private String iid;
	private int count;// 数量
	private double subtotal;// 小计
	private Order order;// 所属订单
	private Tests tests;//所要洗的衣服

	public String getIid() {
		return iid;
	}

	public void setIid(String iid) {
		this.iid = iid;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Tests getClothes() {
		return tests;
	}

	public void setClothes(Tests tests) {
		this.tests = tests;
	}
}
