package com.ssh.serviceimpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.dao.ProvinceDataDao;
import com.ssh.entity.ProvinceData;
import com.ssh.service.ProvinceDataService;

@Service
public class ProvinceDataServiceImpl implements ProvinceDataService {
	@Resource
	private ProvinceDataDao provinceDataDao;

	public ProvinceDataDao getProvinceDataDao() {
		return provinceDataDao;
	}

	public void setProvinceDataDao(ProvinceDataDao provinceDataDao) {
		this.provinceDataDao = provinceDataDao;
	}


    @Transactional
	public void addProvincedata(List<ProvinceData> list) throws Exception{
		// TODO Auto-generated method stub
    	System.out.println("list长度："+list.size());
    	try{
    		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    		
		Date date=new Date();
		sdf.format(date);
		for(ProvinceData provinceData:list){
			provinceData.setDate(date);
			provinceDataDao.addProvincedata(provinceData);
			
		}
		}
    	catch(Exception e){
    		e.printStackTrace();
    		throw e;
    	}
	}

	public Date selectMaxDate() throws Exception {
		// TODO Auto-generated method stub
		Date date=null;
		try{
		date=provinceDataDao.selectMaxDate();
		
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		return date;
	}

	public List<ProvinceData> selectByMaxDate(Date date) throws Exception {
		// TODO Auto-generated method stub
		List<ProvinceData> list=null;
		try{
		list=provinceDataDao.selectByMaxDate(date);
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		return list;

	}

	public List<ProvinceData> selectByDateCondition(Date beginDate, Date endDate,String province,int step)
			throws Exception {
		// TODO Auto-generated method stub
		List<ProvinceData> list=null;
		List<ProvinceData> invokeUserDatas=null;
		try{
			list=provinceDataDao.selectByDateCondition(beginDate, endDate,province);
			invokeUserDatas=new ArrayList<ProvinceData>();
			for(int i=0;i<list.size();i=i+step){
				invokeUserDatas.add(list.get(i));
			}
			
		}catch(Exception e){
			
			e.printStackTrace();
			throw e;
		}
		return invokeUserDatas;
	}

}
