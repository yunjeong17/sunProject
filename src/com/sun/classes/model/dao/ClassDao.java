package com.sun.classes.model.dao;

import static com.sun.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Properties;

import com.sun.classes.model.vo.Classes;
import com.sun.common.CommonDao;

public class ClassDao {
	Properties prop;
	public ClassDao() {
		// TODO Auto-generated constructor stub
		String fileName = Classes.class.getResource("/sql/classes/professorsClass-query.properties").getPath();
		prop= new CommonDao().propLoad(fileName);
	}
	
	//userId
	public ArrayList<Classes> selectClassList(Connection conn, String userId) {
		ArrayList<Classes> list=new ArrayList<Classes>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectClass");
		System.out.println(sql);
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			
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
				System.out.println(c.getClassNo());
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
	
	
	
}
