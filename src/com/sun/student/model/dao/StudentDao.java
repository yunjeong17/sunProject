package com.sun.student.model.dao;

import static com.sun.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.sun.common.CommonDao;
import com.sun.student.model.vo.Student;

public class StudentDao {
	
	private Properties prop;
	public StudentDao() {
		String fileName = Student.class.getResource("/sql/admin/admin-query.properties").getPath();
		prop = new CommonDao().propLoad("Professors",fileName);
	}

	/******************************************************/
	
	public ArrayList<Student> studentList(Connection conn) {
		ArrayList<Student> list = null;		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("stInfo");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset=pstmt.executeQuery();
			list = new ArrayList<Student>();
			while(rset.next()) {
				Student s = new Student();
				s.setsId(rset.getString("S_ID"));
				s.setsName(rset.getString("S_NAME"));
				s.setsLevel(rset.getInt("S_LEVEL"));
				s.setdName(rset.getString("DEPT_NAME"));
				s.setcName(rset.getString("C_NAME"));
				s.setpName(rset.getString("P_NAME"));
				
				list.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error occurred at studentDao");
		}
		finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
}
