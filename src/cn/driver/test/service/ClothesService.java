package cn.driver.test.service;

import java.util.List;

import cn.driver.test.dao.TestDao;
import cn.driver.test.daomain.Tests;
import cn.driver.test.daomain.PageBean;



public class ClothesService {
	
	private TestDao testDao =new TestDao ();

	public PageBean<Tests> findAll(int pc, int ps) {
		return testDao.findAll(pc, ps);
	}
	public Tests load(String cid) {
		
		return testDao.findByCid(cid);
	}
	public List<Tests> findCname(String cname) {
		return testDao.findCname(cname);
	}
	public List<Tests> findAll() {
		
		return testDao.findAll();
	}
	/**
	 * 　添加图书
	 * @param book
	 */
	public void add(Tests tests) {
		testDao.add(tests);
	}
	
	public void delete(String cid) {
		testDao.delete(cid);
	}

	public void edit(Tests tests) {
		testDao.edit(tests);
	}

}
