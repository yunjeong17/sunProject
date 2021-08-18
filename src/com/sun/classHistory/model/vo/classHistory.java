package com.sun.classHistory.model.vo;

public class classHistory {
	private String pId;
	private String classNo;
	private int cgPoint;
	
	public classHistory() {
		// TODO Auto-generated constructor stub
	}

	public classHistory(String pId, String classNo, int cgPoint) {
		super();
		this.pId = pId;
		this.classNo = classNo;
		this.cgPoint = cgPoint;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getClassNo() {
		return classNo;
	}

	public void setClassNo(String classNo) {
		this.classNo = classNo;
	}

	public int getCgPoint() {
		return cgPoint;
	}

	public void setCgPoint(int cgPoint) {
		this.cgPoint = cgPoint;
	}
	
}
