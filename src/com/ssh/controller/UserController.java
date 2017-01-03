package com.ssh.controller;

import java.io.IOException;
import java.io.PrintWriter;


import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
public void login(String username,String password,String status,HttpServletResponse response,HttpSession session) throws IOException{
	PrintWriter out=response.getWriter();
	
	User user=new User();
	user.setUsername(username);
	user.setPassword(password);
	user.setStatus(Integer.valueOf(status));
	User userGet=userServiceImpl.selectUser(user);
	if(userGet==null){
		String json="{\"result\":false}";
		out.print(json);
	}
	else{
		session.setAttribute("user", userGet);
		String json="{\"result\":true}";
		out.print(json);
	}

	
}
@RequestMapping("/tomain")
public String tomain(HttpServletRequest request){
	
    HttpSession session=request.getSession();
	User user=(User)session.getAttribute("user");
	if(user==null){
		return "login";
	}
	else{
	return "main";
	}
}
@RequestMapping("/exit")
public String exitlogin(HttpServletRequest request){
	request.getSession().invalidate();
	return "login";
}
}
