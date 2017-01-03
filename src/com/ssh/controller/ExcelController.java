package com.ssh.controller;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.entity.ProvinceData;
import com.ssh.entity.User;
import com.ssh.service.ProvinceDataService;
import com.ssh.util.ParseExcelUtil;

@Controller
public class ExcelController {
	@Autowired
	private ProvinceDataService provinceDataServiceImpl;

	@RequestMapping("/excelparse")
	public String parseExcel(HttpServletRequest request,
			HttpServletResponse response) {
		String message = "文件上传成功！";
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("utf-8");
			List<FileItem> list = upload.parseRequest(request);
			for (FileItem item : list) {
				if (item.isFormField()) {
					String name = item.getFieldName();
					String value = item.getString("utf-8");
					System.out.println(name + "=" + value);

				} else {
					String filename = item.getName();
					if (filename == null || filename.trim().equals("")) {
						throw new Exception();
					}
					InputStream in = item.getInputStream();
					List<ProvinceData> ProvinceDataList = ParseExcelUtil
							.parseExcel(in, filename);
					if (ProvinceDataList  != null) {
						System.out.println("文件读取成功!");
                        provinceDataServiceImpl.addProvincedata(ProvinceDataList);
					} else {
                        message="文件解析出错！";
					}
				}

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block

			message = "文件解析出错！";

		}

		request.setAttribute("message", message);

		return "excelparsestatus";
	}

	public ProvinceDataService getProvinceDataServiceImpl() {
		return provinceDataServiceImpl;
	}

	public void setProvinceDataServiceImpl(
			ProvinceDataService provinceDataServiceImpl) {
		this.provinceDataServiceImpl = provinceDataServiceImpl;
	}
	@RequestMapping("/datamanage")
	public String toDataManage(HttpSession session){
		if(((User)session.getAttribute("user"))!=null){
		return "datamanage";
		}
		else{
			return "pagewrong";
		}
	}
	@RequestMapping("/datashow")
	public String toDataShow(HttpSession session){
		if(((User)session.getAttribute("user"))!=null){
		return "datashow";
		}
		else{
			return "pagewrong";
		}
	}

}
