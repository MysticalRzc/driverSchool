package cn.driver.test.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.driver.test.daomain.Tests;
import cn.driver.test.daomain.PageBean;
import cn.itcast.jdbc.TxQueryRunner;

public class TestDao {
	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 查询所有衣服
	 * 
	 * @return
	 */
	public List<Tests> findAll() {
		try {
			String sql = "select * from clothes";
			return qr.query(sql, new BeanListHandler<Tests>(Tests.class));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public boolean adminFind(){
		return true;
	}
	/**
	 * 查询所有衣服返回分页
	 * 
	 * @return
	 */
	public PageBean<Tests> findAll(int pc, int ps) {
		try {
			String sql = "select count(*) from clothes";
			int tr = ((Number) qr.query(sql, new ScalarHandler())).intValue();
			sql = "select * from clothes limit ?,?";
			List<Tests> customerList = qr.query(sql,
					new BeanListHandler<Tests>(Tests.class), (pc - 1) * ps,
					ps);
			PageBean<Tests> pb = new PageBean<Tests>();
			pb.setPc(pc);
			pb.setPs(ps);
			pb.setTr(tr);
			pb.setDatas(customerList);
			return pb;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Tests findByCid(String cid) {
		try {
			String sql = "select * from clothes where cid=?";
			return qr.query(sql, new BeanHandler<Tests>(Tests.class), cid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Tests> findCname(String cname) {
		try {
			String sql = "select * from clothes where cname=?";
			return qr.query(sql, new BeanListHandler<Tests>(Tests.class),
					cname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 添加衣服
	 * 
	 * @param book
	 */
	public void add(Tests tests) {
		try {
			String sql = "insert into clothes values(?,?,?,?,?,?)";
			Object[] params = { tests.getCid(), tests.getCname(),
					tests.getUnit(), tests.getPrice(), tests.getType(),
					tests.getImage() };
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 删除衣服
	 * 
	 * @param bid
	 */
	public void delete(String cid) {
		try {
			String sql = "delete from clothes where cid=?";
			qr.update(sql, cid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void edit(Tests tests) {
		try {
			String sql = "update clothes set cname=?, unit=?,price=?,type=?, image=? where cid=?";
			Object[] params = { tests.getCname(), tests.getUnit(),
					tests.getPrice(), tests.getType(), tests.getImage(),
					tests.getCid() };
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
