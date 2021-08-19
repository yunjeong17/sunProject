package com.sun.classHistory.model.service;

import static com.sun.common.JDBCTemplate.close;
import static com.sun.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.sun.classHistory.model.dao.ClassHistoryDao;
import com.sun.classHistory.model.vo.ClassHistory;

public class ClassHistoryService {

	public ArrayList<ClassHistory> selectchList(String cId) {
		Connection conn = getConnection();
		ArrayList<ClassHistory> chList = new ClassHistoryDao().selectchList(conn,cId);
		close(conn);
		return chList;
	}

	

}
