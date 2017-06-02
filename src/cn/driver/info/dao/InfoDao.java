package cn.driver.info.dao;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.driver.Visited_SQL;
import cn.driver.info.daomain.Info;
import cn.itcast.jdbc.TxQueryRunner;

public class InfoDao {
	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 添加个人信息
	 * 
	 * @param info
	 */
	public void add(Info info) {
		try {
	/*		String sql = "insert into info values(?,\"张三\",?,?,?,?,?,?)";*/
			byte b[] = info.getUid().getBytes("ISO-8859-1");
			String Uid = new String(b, "UTF-8");
			b = info.getIname().getBytes("ISO-8859-1");
			String name = new String(b, "UTF-8");
			b = info.getSex().getBytes("ISO-8859-1");
			String sex = new String(b, "UTF-8");
			b = info.getAddress().getBytes("ISO-8859-1");
			String address = new String(b, "UTF-8");
			b = info.getNote().getBytes("ISO-8859-1");
			String node = new String(b, "UTF-8");
			System.out.println(sex);
			Visited_SQL sqlVister = new Visited_SQL();
			String sql = "insert into info values(\""+Uid+"\",\""+sex+"\",\""+info.getBirthday()+"\",\""+info.getEmail()+"\",\""+info.getPhone()+"\",\""+address+"\",\""+node+"\")";
			sqlVister.writing(sql);
/*			Object[] params = { Uid, sex, info.getBirthday(),
					info.getEmail(), info.getPhone(), address, node };
			qr.update(sql, params);*/
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 按用户id查询
	 * 
	 * @param uid
	 * @return
	 */
	public Info findByUid(String uid) {
		try {
			String sql = "select * from info where uid=?";
			return qr.query(sql, new BeanHandler<Info>(Info.class), uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void update(Info info) {
		try {
		/*	String sql = "update info set iname=?,sex=?,birthday=?,email=?,phone=?,address=?,note=? where uid=?";*/
			byte b[] = info.getUid().getBytes("ISO-8859-1");
			String Uid = new String(b, "UTF-8");
			b = info.getIname().getBytes("ISO-8859-1");
			String name = new String(b, "UTF-8");
			b = info.getSex().getBytes("ISO-8859-1");
			String sex = new String(b, "UTF-8");
			b = info.getAddress().getBytes("ISO-8859-1");
			String address = new String(b, "UTF-8");
			b = info.getNote().getBytes("ISO-8859-1");
			String node = new String(b, "UTF-8");
			System.out.println(name);
			Visited_SQL sqlVister = new Visited_SQL();
	//		String sql = "insert into info values(\""+Uid+"\",\""+sex+"\",\""+info.getBirthday()+"\",\""+info.getEmail()+"\",\""+info.getPhone()+"\",\""+address+"\",\""+node+"\")";
			String sql = "update info set iname=\""+name+"\",sex=\""+sex+"\",birthday=\""+info.getBirthday()+"\",email=\""+info.getEmail()+"\",phone=\""+info.getPhone()+"\",address=\""+address+"\",note=\""+node+"\" where uid=\""+Uid;
			sqlVister.writing(sql);
			
/*			Object[] params = { name, sex, info.getBirthday(), info.getEmail(),
					info.getPhone(), address, node, Uid };
			qr.update(sql, params);*/
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
