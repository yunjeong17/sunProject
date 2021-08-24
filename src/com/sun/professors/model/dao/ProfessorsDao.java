package com.sun.professors.model.dao;

import static com.sun.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.sun.common.CommonDao;
import com.sun.student.model.vo.PageInfo;
import com.sun.student.model.vo.Student;
import com.sun.student.model.vo.StudentConsulting;

public class ProfessorsDao {
	
	private Properties prop;
	
	public ProfessorsDao() {
		String fileName = Student.class.getResource("/sql/professors/professors-query.properties").getPath();
		prop= new CommonDao().propLoad(fileName);
	}
	
	
	public ArrayList<Student> selectchList(Connection conn, String userId) {
		ArrayList<Student> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectsList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			list = new ArrayList<Student>();
			while (rset.next()) {
				Student s = new Student();
				s.setUserId(rset.getString("S_ID"));
				s.setUserName(rset.getString("S_NAME"));
				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	public ArrayList<StudentConsulting> selectConsultingList(Connection conn, String sId,PageInfo pi) {
		ArrayList<StudentConsulting> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectConsultingList");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			list = new ArrayList<StudentConsulting>();
			while (rset.next()) {
				StudentConsulting sc = new StudentConsulting();
				sc.setCsNo(rset.getInt("CS_NO"));
				sc.setCsContent(rset.getString("CS_CONTENTS"));
				sc.setCsDate(rset.getDate("CS_DATE"));
				sc.setCsTime(rset.getString("CS_TIME"));
				sc.setCsWay(rset.getString("CS_WAY"));
				sc.setCsType(rset.getString("CS_TYPE"));
				list.add(sc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}


	public int insertConsulting(Connection conn, StudentConsulting sc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertConsulting");
		
//		insertConsulting=INSERT INTO CONSULTING VALUES
//		(SEQ_CONSULTING.NEXTVAL,     ?,             ?,       ?    ,    ?,     ?,           ?)
//		        CS_NO               S_ID    CS_CONTENTS   CS_DATE  CS_TIME     CS_WAY     CS_TYPE
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,sc.getsId());
			pstmt.setString(2,sc.getCsContent());
			pstmt.setDate(3,sc.getCsDate());
			pstmt.setString(4,sc.getCsTime());
			pstmt.setString(5,sc.getCsWay());
			pstmt.setString(6,sc.getCsType());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	public int updateConsulting(Connection conn, StudentConsulting sc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateConsulting");
		

//		updateConsulting=UPDATE CONSULTING SET CS_CONTENTS=?,CS_DATE=?,CS_TIME=?,CS_WAY=?,CS_TYPE=? WHERE S_ID=? AND CS_NO=?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,sc.getCsContent());
			pstmt.setDate(2,sc.getCsDate());
			pstmt.setString(3,sc.getCsTime());
			pstmt.setString(4,sc.getCsWay());
			pstmt.setString(5,sc.getCsType());
			pstmt.setString(6,sc.getsId());
			pstmt.setInt(7,sc.getCsNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	public int deleteConsulting(Connection conn, int csNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteConsulting");
		

//		updateConsulting=UPDATE CONSULTING SET CS_CONTENTS=?,CS_DATE=?,CS_TIME=?,CS_WAY=?,CS_TYPE=? WHERE S_ID=? AND CS_NO=?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,csNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	public int getListCount(Connection conn, String sId) {
		int listCount = 0;

		PreparedStatement pstmt=null;
		ResultSet rset = null;

		String sql = prop.getProperty("getListCount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, sId);
			rset= pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
		}

		return listCount;
	}
}
