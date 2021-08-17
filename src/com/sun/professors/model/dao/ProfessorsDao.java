package com.sun.professors.model.dao;

import java.util.Properties;

import com.sun.common.CommonDao;
import com.sun.student.model.vo.Student;

public class ProfessorsDao {
	private Properties prop;
	public ProfessorsDao() {
		String fileName = Student.class.getResource("/sql/professors/professors-query.properties").getPath();
		prop= new CommonDao().propLoad("Professors",fileName);
	}
}
