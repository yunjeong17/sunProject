package com.sun.user.model.service;

import static com.sun.common.JDBCTemplate.close;
import static com.sun.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.sun.user.model.dao.UserDao;
import com.sun.user.model.vo.User;
public class UserService {

	public User loginUser(String userId, String userPwd) {
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
		User loginUser = new UserDao().loginUser(conn, userId, userPwd,tableName);
		close(conn);
		return loginUser;
	}

}