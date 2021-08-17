package com.sun.student.model.service;


import static com.sun.common.JDBCTemplate.close;
import static com.sun.common.JDBCTemplate.commit;
import static com.sun.common.JDBCTemplate.getConnection;
import static com.sun.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.sun.student.model.dao.StudentDao;
import com.sun.student.model.vo.Student;
import com.sun.student.model.vo.PageInfo;

public class StudentService {
	public int getListCount() {
		Connection conn = getConnection();
		int listCount = new StudentDao().getListCount(conn);
		
		close(conn);
		return listCount;
	}

	public ArrayList<Student> studentList(PageInfo pi){
		Connection conn = getConnection();

		ArrayList<Student> list = new StudentDao().studentList(conn,pi);
		
		close(conn);
		
		return list;
	}

	public int insertStudent(Student st) {
		
		Connection conn = getConnection();
		
		int result = new StudentDao().insertStudent(conn, st);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Student> getPList() {
		Connection conn = getConnection();

		ArrayList<Student> pList = new StudentDao().getPList(conn);
		
		close(conn);
		
		return pList;
	}

	public ArrayList<Student> getCList() {
		Connection conn = getConnection();

		ArrayList<Student> pList = new StudentDao().getCList(conn);
		
		close(conn);
		
		return pList;
	}

	public Student searchStudent(String search) {
		Connection conn = getConnection();

		Student st = new StudentDao().searchStudent(conn,search);
		
		close(conn);
		
		return st;
	}	
}
