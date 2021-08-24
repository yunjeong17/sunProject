package com.sun.classes.model.dao;

import static com.sun.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.sun.classes.model.vo.Classes;
import com.sun.common.CommonDao;
import com.sun.student.model.vo.PageInfo;

public class ClassDao {
	Properties prop;
	public ClassDao() {
		// TODO Auto-generated constructor stub
		String fileName = Classes.class.getResource("/sql/classes/professorsClass-query.properties").getPath();
		prop= new CommonDao().propLoad(fileName);
	}
	
	//userId
	public ArrayList<Classes> selectClassList(Connection conn, String userId, String cName, PageInfo pi) {
		ArrayList<Classes> list=new ArrayList<Classes>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectClass");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		System.out.println(sql);
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2,  cName);
			
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			System.out.println(cName);
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				Classes c = new Classes(
							rset.getString("CLASS_NO"),
							rset.getString("CLASS_NAME"),
							rset.getString("CLASS_PLACE"),
							rset.getString("CLASS_TYPE_NAME"),
							rset.getString("P_ID"),
							rset.getInt("CLASS_YEAR"),
							rset.getInt("CLASS_SEMESTER")
						);
				list.add(c);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}

		return list;
	}
	
	//	userId와 현재 연도, 학기에 따른 클래스
	public ArrayList<Classes> selectClassByYearAndSemester(Connection conn, String userId,int year, int semester) {
		ArrayList<Classes> list=new ArrayList<Classes>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectClassListYearAndSemester");
		System.out.println(sql);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2,year);
			pstmt.setInt(3, semester);
			
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				Classes c = new Classes();
				c.setClassNo(rset.getString("CLASS_NO"));
				c.setClassName(rset.getString("CLASS_NAME"));
				list.add(c);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		return list;
	}

	public int getListCount(Connection conn,String userId) {
		int listCount = 0;

		PreparedStatement pstmt=null;
		ResultSet rset = null;

		String sql = prop.getProperty("getListCount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
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
