package com.sun.classes.model.service;

import static com.sun.common.JDBCTemplate.close;
import static com.sun.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;

import com.sun.classes.model.dao.ClassDao;
import com.sun.classes.model.vo.Classes;
import com.sun.student.model.vo.PageInfo;

public class ClassService {

	public ArrayList<Classes> selectClassList(String userId,String cName,PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Classes> list = new ClassDao().selectClassList(conn,userId,cName,pi);
		close(conn);
		return list;

	}

//	연도와학기
	public ArrayList<Classes> selectClassByUserIdAndYearAndSemester(String userId) {
		Connection conn = getConnection();
		
		Calendar calendar = Calendar.getInstance();
		int year=calendar.get(Calendar.YEAR);
		int month=calendar.get(Calendar.MONTH)+1;
		int semester=0; //0학기는 계절학기로 취급
		if(month>=2 && month<=6) { //1학기
			semester=1;
		}
		else if(month>=9 && month<=12) { //2학기
			semester=2;
		}
		
		ArrayList<Classes> list = new ClassDao().selectClassByYearAndSemester(conn,userId,year,semester);
		close(conn);
		return list;
	}


		public int getListCount(String userId) {
			Connection conn = getConnection();
			int listCount = new ClassDao().getListCount(conn,userId);
			
			close(conn);
			return listCount;
		}



}
