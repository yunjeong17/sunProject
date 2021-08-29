package com.sun.classes.model.vo;

public class Classes {
	private String classNo;
	private String className;
	private String classPlace;
	private int classTypeNo;
	private String pId;
	private int classYear;
	private int classSemester;
	private String classTypeName;
	
	public Classes() {
		// TODO Auto-generated constructor stub
	}

	
	
	public Classes(String classNo, String className, String classPlace, int classTypeNo, String pId, int classYear,
			int classSemester, String classTypeName) {
		super();
		this.classNo = classNo;
		this.className = className;
		this.classPlace = classPlace;
		this.classTypeNo = classTypeNo;
		this.pId = pId;
		this.classYear = classYear;
		this.classSemester = classSemester;
		this.classTypeName = classTypeName;
	}



	public Classes(String classNo, String className, String classPlace, String classTypeName, String pId, int classYear,
			int classSemester) {
		super();
		this.classNo = classNo;
		this.className = className;
		this.classPlace = classPlace;
		this.classTypeName = classTypeName;
		this.pId = pId;
		this.classYear = classYear;
		this.classSemester = classSemester;
	}

	public String getClassTypeName() {
		return classTypeName;
	}

	public void setClassTypeName(String classTypeName) {
		this.classTypeName = classTypeName;
	}

	public int getClassYear() {
		return classYear;
	}

	public void setClassYear(int classYear) {
		this.classYear = classYear;
	}

	public int getClassSemester() {
		return classSemester;
	}

	public void setClassSemester(int classSemester) {
		this.classSemester = classSemester;
	}

	public String getClassNo() {
		return classNo;
	}
	public void setClassNo(String classNo) {
		this.classNo = classNo;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getClassPlace() {
		return classPlace;
	}
	public void setClassPlace(String classPlace) {
		this.classPlace = classPlace;
	}
	public int getClassTypeNo() {
		return classTypeNo;
	}
	public void setClassTypeNo(int classTypeNo) {
		this.classTypeNo = classTypeNo;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	
	
	//합친부분
	public Classes(String classNo, String className, String classPlace, int classTypeNo, String pId, int classYear,
			int classSemester) {
		super();
		this.classNo = classNo;
		this.className = className;
		this.classPlace = classPlace;
		this.classTypeNo = classTypeNo;
		this.pId = pId;
		this.classYear = classYear;
		this.classSemester = classSemester;
		
	}
	
}
