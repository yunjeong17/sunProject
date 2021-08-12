package com.sun.student.model.vo;

import java.sql.Date;

public class Student {
	
	private String sId; //학번  
	private String pId; //전담교수번호  
	private String sPwd; //비밀번호  
	private String cNo; //학과번호
	private String sName; //이름  
	private Date sEDate; //입학일
	private String sPhone; //핸드폰번호
	private String sEmail; //이메일  
	private String sImg; //학생 사진 경로  
	private String flChange; //학적상태   
	
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
