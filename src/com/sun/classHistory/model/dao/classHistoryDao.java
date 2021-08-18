package com.sun.classHistory.model.dao;

import java.util.Properties;

import com.sun.classes.model.vo.Classes;
import com.sun.common.CommonDao;

public class classHistoryDao {
	Properties prop;
	public classHistoryDao() {
		String fileName = Classes.class.getResource("/sql/classHistory/professorsClassHistory-query.properties").getPath();
		prop= new CommonDao().propLoad(fileName);
	}
	
}
