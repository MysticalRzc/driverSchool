package cn.driver.user.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.driver.user.domain.User;
import cn.itcast.jdbc.TxQueryRunner;

public class UserDao {
	private QueryRunner qr = new TxQueryRunner();
	/**
	 * 按用户名查询
	 * 
	 * @param username
	 * @return
	 */
	public User findByUsername(String name) {
		try {
			String sql = "select * from user where name=?";
			return qr.query(sql, new BeanHandler<User>(User.class), name);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 插入User
	 * 
	 * @param user
	 */
	public void add(User user) {
		try {
			String sql = "insert into user values(?,?,?,?)";
			Object[] params = { user.getUid(), user.getName(),
					user.getPassword(),0};
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
