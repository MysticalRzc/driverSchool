package cn.driver.evaluation.service;

import java.util.List;

import cn.driver.evaluation.dao.EvaluationDao;
import cn.driver.evaluation.daomain.Evaluation;

public class EvaluationService {
    private EvaluationDao evaluationdao=new EvaluationDao();

	public void add(Evaluation et) {
		
		evaluationdao.add(et);
	}

	public List<Evaluation> findAll() {
		return evaluationdao.findAll();
	}
}
