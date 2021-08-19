package com.sun.classHistory.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.sun.classHistory.model.vo.ClassHistory;
import com.sun.classes.model.vo.Classes;
import com.sun.common.CommonDao;

import static com.sun.common.JDBCTemplate.close;

public class ClassHistoryDao {
	Properties prop;
	public ClassHistoryDao() {
		String fileName = Classes.class.getResource("/sql/classHistory/professorsClassHistory-query.properties").getPath();
		prop= new CommonDao().propLoad(fileName);
	}
	public ArrayList<ClassHistory> selectchList(Connection conn, String cNo) {
		ArrayList<ClassHistory> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectchList");
		System.out.println("sql:::"+sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cNo);
			rset = pstmt.executeQuery();
			list = new ArrayList<ClassHistory>();
			while (rset.next()) {
				list.add(new ClassHistory(rset.getString("S_ID"),
									rset.getString("S_NAME"),
									rset.getFloat("CG_POINT"),
									rset.getString("C_NAME")
									));
				System.out.println("rset!!:"+rset.getString("S_NAME"));
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
	
}
