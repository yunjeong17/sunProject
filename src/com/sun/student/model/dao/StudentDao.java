package com.sun.student.model.dao;

import java.util.Properties;

import com.sun.common.CommonDao;
import com.sun.student.model.vo.Student;

public class StudentDao {
	public StudentDao() {
		// TODO Auto-generated constructor stub
		String fileName = Student.class.getResource("/sql/student/student-query.properties").getPath();
		Properties prop= new CommonDao().propLoad("Student",fileName);
	}
	
}
