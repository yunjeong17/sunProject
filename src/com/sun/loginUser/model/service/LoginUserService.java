package com.sun.loginUser.model.service;

import static com.sun.common.JDBCTemplate.close;
import static com.sun.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.sun.loginUser.model.dao.LoginUserDao;
import com.sun.loginUser.model.vo.LoginUser;
public class LoginUserService {

	public LoginUser loginUser(String userId, String userPwd) {
		Connection conn = getConnection();
		String tableName="";
		if( Character.toUpperCase(userId.charAt(0))  =='P') {
			tableName="Professors";
		}
		else if( Character.toUpperCase(userId.charAt(0))  =='A') {
			tableName="Admin";
		}
		else {
			tableName="Student";
		}
		System.out.println(tableName);
		LoginUser loginUser = new LoginUserDao().loginUser(conn, userId, userPwd,tableName);
		close(conn);
		return loginUser;
	}

}
