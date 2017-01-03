package com.ssh.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.entity.ProvinceData;
import com.ssh.entity.User;
import com.ssh.service.ProvinceDataService;

@Controller
public class DataController {
	@Autowired
	private ProvinceDataService provinceDataServiceImpl;
	public ProvinceDataService getProvinceDataServiceImpl() {
		return provinceDataServiceImpl;
	}
	public void setProvinceDataServiceImpl(
			ProvinceDataService provinceDataServiceImpl) {
		this.provinceDataServiceImpl = provinceDataServiceImpl;
	}
	@RequestMapping("/onlineuser")
	public String getOnlineUser(HttpSession session){
		if(((User)session.getAttribute("user"))!=null){
		return "onlineuser";
		}
		else{
			return "login";
		}
	}
	@RequestMapping("/invokeuser")
	public String getInvokeUserTrend(HttpSession session){
		if(((User)session.getAttribute("user"))!=null){
		return "invokeusertrend";
		}
		else{
			return "login";
		}
	}
	@RequestMapping("/getOnlineUserData")
public void getOnlineUserData(HttpServletResponse response,HttpSession session){

		response.setCharacterEncoding("utf-8");
		PrintWriter out=null;
		try {
		out=response.getWriter();
		if(((User)session.getAttribute("user"))!=null){
		
		
		Date maxDate=provinceDataServiceImpl.selectMaxDate();
		
			List<ProvinceData> list=provinceDataServiceImpl.selectByMaxDate(maxDate);
			if(list!=null&&list.size()==32){
				
				
				JSONArray jsonArray=JSONArray.fromObject(list);
				String json=jsonArray.toString();
				out.print(json);
				
				
				System.out.println(json);
			}else{
				out.print("\"nodata\":true");
			}
			
		}
		else{
			out.print("{\"nodata\":false}");
		}
			
			 
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		out.print("{\"nodata\":false}");
		
		System.out.println("获取失败");
		
	}
}
	@RequestMapping("/getInvokeUserData")
	public void getInvokeUserData(String beginDate,String endDate,String province,int step,HttpSession session,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		PrintWriter out=null;
		try{
			out=response.getWriter();
			if(((User)session.getAttribute("user"))!=null){
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				Date begin=sdf.parse(beginDate);
				Date end=sdf.parse(endDate);
				List<ProvinceData> list=provinceDataServiceImpl.selectByDateCondition(begin, end, province, step);
				if(list!=null){
					JSONArray jsonArray=JSONArray.fromObject(list);
					String json=jsonArray.toString();
					out.print(json);
					System.out.println(json);
				}
				else{
					out.print("{\"nodata\":false}");
				}
			}
			else{
				out.print("{\"nodata\":false}");
			}
		}catch(Exception e){
			e.printStackTrace();
			out.print("{\"nodata\":false}");
			System.out.println("获取失败");
		}
	}
}
