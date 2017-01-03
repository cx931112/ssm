package com.ssh.dao;

import java.util.Date;
import java.util.List;


import com.ssh.entity.ProvinceData;

public interface ProvinceDataDao {
public void addProvincedata(ProvinceData provinceData) ;
public Date selectMaxDate();
public List<ProvinceData> selectByMaxDate(Date date); 
public List<ProvinceData> selectByDateCondition(Date beginDate,Date endDate,String province);
}
