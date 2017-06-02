package cn.driver.evaluation.daomain;

import cn.driver.test.daomain.Tests;
import cn.driver.user.domain.User;

public class Evaluation {
	private String eid;
	private String uid;
	private String cid;
	private String evaluation;
	
	public String getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}

	public Evaluation() {
		super();
	}

	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

}
