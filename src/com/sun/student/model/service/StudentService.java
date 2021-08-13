package com.sun.student.model.service;

import static com.sun.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.sun.student.model.dao.StudentDao;
import com.sun.student.model.vo.Student;

public class StudentService {

	public ArrayList<Student> studentList() {
		Connection conn = getConnection();
		
		ArrayList<Student> list = new StudentDao().studentList(conn);
		//close(conn);
		return list;
	}

}
