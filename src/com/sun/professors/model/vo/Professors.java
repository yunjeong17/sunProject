package com.sun.professors.model.vo;

public class Professors {
	private String pId;
	private String pPwd;
	private String pName;
	private String cNo;
	private String pPhone;
	private String pEmail;
	
	public Professors() {
		// TODO Auto-generated constructor stub
	}

	public Professors(String pId, String pPwd, String pName) {
		super();
		this.pId = pId;
		this.pPwd = pPwd;
		this.pName = pName;
	}

	public Professors(String pPhone, String pEmail) {
		super();
		this.pPhone = pPhone;
		this.pEmail = pEmail;
	}

	public Professors(String pId, String pPwd, String pName, String cNo, String pPhone, String pEmail) {
		super();
		this.pId = pId;
		this.pPwd = pPwd;
		this.pName = pName;
		this.cNo = cNo;
		this.pPhone = pPhone;
		this.pEmail = pEmail;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getpPwd() {
		return pPwd;
	}

	public void setpPwd(String pPwd) {
		this.pPwd = pPwd;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getcNo() {
		return cNo;
	}

	public void setcNo(String cNo) {
		this.cNo = cNo;
	}

	public String getpPhone() {
		return pPhone;
	}

	public void setpPhone(String pPhone) {
		this.pPhone = pPhone;
	}

	public String getpEmail() {
		return pEmail;
	}

	public void setpEmail(String pEmail) {
		this.pEmail = pEmail;
	}
	
	
	
}
