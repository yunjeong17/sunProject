package com.sun.classes.model.service;

import static com.sun.common.JDBCTemplate.close;
import static com.sun.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.sun.classes.model.dao.ClassDao;
import com.sun.classes.model.vo.Classes;

public class ClassService {

	public ArrayList<Classes> selectClass(String userId) {
		Connection conn = getConnection();
		ArrayList<Classes> list = new ClassDao().selectClass(conn,userId);
		close(conn);
		return list;

	}

}
