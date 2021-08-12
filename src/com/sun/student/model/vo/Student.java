package com.sun.student.model.vo;

import java.sql.Date;

public class Student {
	
	private String sId; //�й�  
	private String pId; //���㱳����ȣ  
	private String sPwd; //��й�ȣ  
	private String cNo; //�а���ȣ
	private String sName; //�̸�  
	private Date sEDate; //������
	private String sPhone; //�ڵ�����ȣ
	private String sEmail; //�̸���  
	private String sImg; //�л� ���� ���  
	private String flChange; //��������   
	
	public Student() {
		// TODO Auto-generated constructor stub
	}


	
	public Student(String sId, String sPwd) {
		super();
		this.sId = sId;
		this.sPwd = sPwd;
	}



	public Student(String sName, String sPhone, String sEmail, String sImg) {
		super();
		this.sName = sName;
		this.sPhone = sPhone;
		this.sEmail = sEmail;
		this.sImg = sImg;
	}

	public Student(String sId, String pId, String sPwd, String cNo, String sName, Date sEDate, String sPhone,
			String sEmail, String sImg, String flChange) {
		super();
		this.sId = sId;
		this.pId = pId;
		this.sPwd = sPwd;
		this.cNo = cNo;
		this.sName = sName;
		this.sEDate = sEDate;
		this.sPhone = sPhone;
		this.sEmail = sEmail;
		this.sImg = sImg;
		this.flChange = flChange;
	}



	public String getcNo() {
		return cNo;
	}

	public void setcNo(String cNo) {
		this.cNo = cNo;
	}

	public String getsPhone() {
		return sPhone;
	}

	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getsPwd() {
		return sPwd;
	}

	public void setsPwd(String sPwd) {
		this.sPwd = sPwd;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public Date getsEDate() {
		return sEDate;
	}

	public void setsEDate(Date sEDate) {
		this.sEDate = sEDate;
	}

	public String getsEmail() {
		return sEmail;
	}

	public void setsEmail(String sEmail) {
		this.sEmail = sEmail;
	}

	public String getsImg() {
		return sImg;
	}

	public void setsImg(String sImg) {
		this.sImg = sImg;
	}

	public String getFlChange() {
		return flChange;
	}

	public void setFlChange(String flChange) {
		this.flChange = flChange;
	}
	
}
