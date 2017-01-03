package com.ssh.service;

import java.util.Date;
import java.util.List;

import com.ssh.entity.ProvinceData;

public interface ProvinceDataService  {
public void addProvincedata(List<ProvinceData> list) throws Exception ;
public Date selectMaxDate() throws Exception;
public List<ProvinceData> selectByMaxDate(Date date) throws Exception;
public List<ProvinceData> selectByDateCondition(Date beginDate,Date endDate,String province,int step) throws Exception;
}
