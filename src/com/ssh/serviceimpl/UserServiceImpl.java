package com.ssh.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssh.dao.UserDao;
import com.ssh.entity.User;
import com.ssh.service.UserService;
@Service
public class UserServiceImpl implements UserService{
 @Resource
 private UserDao userDao;
	public UserDao getUserDao() {
	return userDao;
}
public void setUserDao(UserDao userDao) {
	this.userDao = userDao;
}
	public User selectUser(User user) {
		// TODO Auto-generated method stub
		List<User> users=userDao.selectUser(user);
		User userGet=users.get(0);
		return userGet;
	}

}
