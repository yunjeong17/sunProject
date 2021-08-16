package com.sun.loginUser.model.vo;

public class LoginUser {
	private String loginId;
	private String loginPwd;
	private String loginName;
	public LoginUser() {
		// TODO Auto-generated constructor stub
	}
	public LoginUser(String loginId, String loginPwd, String loginName) {
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
