package com.sun.admin.model.vo;

public class Admin {
	private String aId;
	private String aPwd;
	private String aName;
	
	public Admin() {
		// TODO Auto-generated constructor stub
	}

	public Admin(String aId, String aPwd, String aName) {
		super();
		this.aId = aId;
		this.aPwd = aPwd;
		this.aName = aName;
	}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public String getaPwd() {
		return aPwd;
	}

	public void setaPwd(String aPwd) {
		this.aPwd = aPwd;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}
	
	
}
