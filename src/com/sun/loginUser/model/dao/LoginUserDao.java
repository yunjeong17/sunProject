package com.sun.loginUser.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.sun.common.JDBCTemplate.close;
import com.sun.common.CommonDao;
import com.sun.loginUser.model.vo.LoginUser;

public class LoginUserDao {
	private Properties prop;
	public LoginUserDao() {
		// TODO Auto-generated constructor stub
		String fileName = LoginUserDao.class.getResource("/sql/loginUser/login-qeury.properties").getPath();
		prop= new CommonDao().propLoad("LoginUser",fileName);
	}



	public LoginUser loginUser(Connection conn, String userId, String userPwd,String tableName) {
		LoginUser loginUser=null;
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
				loginUser= new LoginUser(
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
