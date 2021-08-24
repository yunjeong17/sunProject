package com.sun.student.model.vo;

import java.sql.Date;

import com.sun.user.model.vo.User;

public class Student extends User{
	
	private String userId; 
	private String userPwd; 
	private String userName; 
	private String pId; 
	private String cNo; 
	private Date sEDate; 
	private String sPhone; 
	private String sEmail; 
	private String sImg; 
	private String flChange; 
	private int sLevel;
	private String deptName;
	private String deptNo;
	private String cName;
	private String pName;
	
	public Student() {
		// TODO Auto-generated constructor stub
	}

	public Student(String userId, String userName, String pId, String cNo, Date sEDate, String sPhone, String sEmail,
			int sLevel) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.pId = pId;
		this.cNo = cNo;
		this.sEDate = sEDate;
		this.sPhone = sPhone;
		this.sEmail = sEmail;
		this.sLevel = sLevel;
	}

	public Student(String userId, String userPwd, String userName, String pId, String cNo, Date sEDate, String sPhone,
			String sEmail, String sImg, String flChange) {
		super(userId,userPwd,userName);
		this.pId = pId;
		this.cNo = cNo;
		this.sEDate = sEDate;
		this.sPhone = sPhone;
		this.sEmail = sEmail;
		this.sImg = sImg;
		this.flChange = flChange;
	}
	
	@Override
	public String toString() {
		return "student["+super.toString()+" pId="+pId+", cNo"+cNo+", sEDate"+sEDate+", sPhone"+sPhone+", sImg "+sImg +", flChange"+flChange+"]";
		
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPId() {
		return pId;
	}

	public void setPId(String pId) {
		this.pId = pId;
	}

	public String getCNo() {
		return cNo;
	}

	public void setCNo(String cNo) {
		this.cNo = cNo;
	}

	public Date getSEDate() {
		return sEDate;
	}

	public void setSEDate(Date sEDate) {
		this.sEDate = sEDate;
	}

	public String getSPhone() {
		return sPhone;
	}

	public void setSPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	public String getSEmail() {
		return sEmail;
	}

	public void setSEmail(String sEmail) {
		this.sEmail = sEmail;
	}

	public String getSImg() {
		return sImg;
	}

	public void setSImg(String sImg) {
		this.sImg = sImg;
	}

	public String getFlChange() {
		return flChange;
	}

	public void setFlChange(String flChange) {
		this.flChange = flChange;
	}

	public int getsLevel() {
		return sLevel;
	}

	public void setsLevel(int sLevel) {
		this.sLevel = sLevel;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}
	
	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}

	

	public Student(String userId, String userName, int sLevel, String deptName, String cName, String pName) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.sLevel = sLevel;
		this.deptName = deptName;
		this.cName = cName;
		this.pName = pName;
	} //관리자-학생 목록
	
	public Student(String pId, String pName) {
		super();
		this.pId = pId;
		this.pName = pName;
	}//교수 드롭다운

	public Student(String cNo, String cName, String deptNo) {
		super();
		this.cNo = cNo;
		this.cName = cName;
		this.deptNo = deptNo;
	}//카테고리 드롭다운
	
	
	
	


}

	