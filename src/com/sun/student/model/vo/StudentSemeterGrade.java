package com.sun.student.model.vo;

public class StudentSemeterGrade {

	private int sId;//학번
	private int gradeNo;//학기별 성적 순번(시퀀스 SEQ_GRADE)
	private int year;//년도 default sysdate
	private int semester;//학기 default sysdate 3~7이면 1, 9~12이면 2
	private int putGrade;//성적
	
	public StudentSemeterGrade() {
		// TODO Auto-generated constructor stub
	}

	public StudentSemeterGrade(int gradeNo, int year, int semester, int putGrade) {
		super();
		this.gradeNo = gradeNo;
		this.year = year;
		this.semester = semester;
		this.putGrade = putGrade;
	}

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public int getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public int getPutGrade() {
		return putGrade;
	}

	public void setPutGrade(int putGrade) {
		this.putGrade = putGrade;
	}
	
	
}
