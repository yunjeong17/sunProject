package com.sun.user.model.vo;

public class User {
	private String loginId;
	private String loginPwd;
	private String loginName;
	public User() {
		// TODO Auto-generated constructor stub
	}
	public User(String loginId, String loginPwd, String loginName) {
		super();
		this.loginId = loginId;
		this.loginPwd = loginPwd;
		this.loginName = loginName;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getLoginPwd() {
		return loginPwd;
	}
	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	
}
