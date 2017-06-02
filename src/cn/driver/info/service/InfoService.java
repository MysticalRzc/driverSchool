package cn.driver.info.service;

import cn.driver.info.dao.InfoDao;
import cn.driver.info.daomain.Info;

public class InfoService {
	private InfoDao infoDao = new InfoDao();
	
	public void add(Info form)
	{
		/*
		 * 添加信息
		 */
		infoDao.add(form);
	}
	
	public Info check(String uid)
	{
		/*
		 * 使用uid查询，得到Info
		 */
		Info info=infoDao.findByUid(uid);
		return info;
	}
	public void update(Info form){
		infoDao.update(form);
	}
}
