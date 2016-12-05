package com.ssh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssh.entity.User;
import com.ssh.serviceimpl.UserServiceImpl;

@Controller
public class UserController {
	@Autowired
	private UserServiceImpl userServiceImpl;
	
public UserServiceImpl getUserServiceImpl() {
		return userServiceImpl;
	}

	public void setUserServiceImpl(UserServiceImpl userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}

@RequestMapping("/tologin")
public ModelAndView login(String username,String password){
	User user=new User();
	user.setUsername(username);
	user.setPassword(password);
	User userGet=userServiceImpl.selectUser(user);
	ModelAndView mv=new ModelAndView();
	mv.addObject("user", userGet);
	mv.setViewName("main");
	return mv;
}

}
