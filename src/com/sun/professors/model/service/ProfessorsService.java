package com.sun.professors.model.service;

import static com.sun.common.JDBCTemplate.close;
import static com.sun.common.JDBCTemplate.commit;
import static com.sun.common.JDBCTemplate.getConnection;
import static com.sun.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.sun.professors.model.dao.ProfessorsDao;
import com.sun.student.model.vo.PageInfo;
import com.sun.student.model.vo.Student;
import com.sun.student.model.vo.StudentConsulting;

public class ProfessorsService {

	public ArrayList<Student> selectStduentList(String userId) {
		Connection conn = getConnection();
		ArrayList<Student> sList = new ProfessorsDao().selectchList(conn,userId);
		close(conn);
		return sList;
	}

	public ArrayList<StudentConsulting> selectConsultingList(String sId,PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<StudentConsulting> cList = new ProfessorsDao().selectConsultingList(conn,sId,pi);
		return cList;
	}

	public int insertConsulting(StudentConsulting sc) {
		int result=0;
		Connection conn = getConnection();

		result=new ProfessorsDao().insertConsulting(conn,sc);

		
		if(result>0) {
			commit(conn);
			
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateConsulting(StudentConsulting sc) {
		int result=0;
		Connection conn = getConnection();

		result=new ProfessorsDao().updateConsulting(conn,sc);

		
		if(result>0) {
			commit(conn);
			
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteConsulting(int csNo) {
		int result=0;
		Connection conn = getConnection();

		result=new ProfessorsDao().deleteConsulting(conn,csNo);

		
		if(result>0) {
			commit(conn);
			
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int getListCount(String sId) {
		Connection conn = getConnection();
		int listCount = new ProfessorsDao().getListCount(conn,sId);
		
		close(conn);
		return listCount;
	}

}
