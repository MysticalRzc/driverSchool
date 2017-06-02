package cn.driver.user.service;

import cn.driver.user.dao.UserDao;
import cn.driver.user.domain.User;
import cn.driver.user.service.UserException;

public class UserService {
private UserDao userDao = new UserDao();
	
	public void regist(User form) throws UserException{
		User user = userDao.findByUsername(form.getName());
		if(user != null) throw new UserException("用户名已存在");
		userDao.add(form);
	}
	public User login(User form) throws UserException {
		User user = userDao.findByUsername(form.getName());
		if(user == null) throw new UserException("用户名为空");
		if(!user.getPassword().equals(form.getPassword()))
			throw new UserException("用户名密码不正确");
		
		return user;
	}
	
	
}
