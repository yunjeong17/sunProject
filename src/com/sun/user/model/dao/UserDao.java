package com.sun.user.model.dao;

import static com.sun.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.sun.common.CommonDao;
import com.sun.user.model.vo.User;

public class UserDao {
	private Properties prop;
	public UserDao() {
		// TODO Auto-generated constructor stub
		String fileName = UserDao.class.getResource("/sql/user/user-qeury.properties").getPath();
		prop= new CommonDao().propLoad(fileName);
	}



	public User loginUser(Connection conn, String userId, String userPwd,String tableName) {
		User loginUser=null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		System.out.println(tableName);
		String sql=prop.getProperty("select"+tableName);
		System.out.println(sql);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser= new User(
							rset.getString(tableName.charAt(0)+"_ID"),
							rset.getString(tableName.charAt(0)+"_PWD"),
							rset.getString(tableName.charAt(0)+"_NAME")
						);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}

		return loginUser;
	}
}
