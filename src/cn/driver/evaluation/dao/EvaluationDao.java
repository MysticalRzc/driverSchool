package cn.driver.evaluation.dao;

import java.sql.*;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;



import cn.driver.Visited_SQL;
import cn.driver.evaluation.daomain.Evaluation;
import cn.itcast.jdbc.TxQueryRunner;

public class EvaluationDao {
	private QueryRunner qr = new TxQueryRunner();

	public void add(Evaluation et) {
		System.out.println(et.getEvaluation());
		Visited_SQL sqlVister = new Visited_SQL();
		String sql = "insert into evaluation values(\""+et.getEid()+"\",\""+et.getCid()+"\",\""+et.getEvaluation()+"\",\""+et.getUid()+"\")";
		sqlVister.writing(sql);
	}

	/**
	 * 查询所有评价
	 * 
	 * @return
	 */
	public List<Evaluation> findAll() {
		try {
			String sql = "select * from evaluation";
			return qr.query(sql, new BeanListHandler<Evaluation>(Evaluation.class));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
