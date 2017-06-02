package cn.driver;

import java.sql.*;

public class Visited_SQL{
	private static final String DRIVERNAME="com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/driverschool?useUnicode=true&characterEncoding=utf-8";
	private static final String USER = "root", PASSWD = "123456";
	private static Connection con = null;
	static{
		loadDriver();
	}
	
	private static void loadDriver(){				//����ݿ�
		try {
			Class.forName(DRIVERNAME);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection()throws SQLException{
		if(con == null)
			con = DriverManager.getConnection(URL,"root","123456");
		return con;
	}
	
	public static void close(){							//�ر���ݿ�
		try {
			if(con != null && !con.isClosed())
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static ResultSet Reading(String reading){		//��ȡ��ݿ�
		try {
			Connection con = Visited_SQL.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(reading);
			return rs;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static boolean writing(String writing){		//�޸���ݿ�
		try {
			Connection con = Visited_SQL.getConnection();
			Statement stmt = con.createStatement();
			stmt.executeUpdate(writing);
			System.out.println("��ݿ�д��ɹ�");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}