
package com.sun.student.model.dao;

import static com.sun.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.sun.common.CommonDao;
import com.sun.student.model.vo.DropDown;
import com.sun.student.model.vo.Fluctuation;
import com.sun.student.model.vo.PageInfo;
import com.sun.student.model.vo.Student;
import com.sun.student.model.vo.StudentConsulting;
import com.sun.student.model.vo.StudentDivisionGrade;
import com.sun.student.model.vo.StudentEarnCredit;
import com.sun.student.model.vo.StudentSemeterGrade;

public class StudentDao {

	private Properties prop;

	public StudentDao() {
		// TODO Auto-generated constructor stub
		String fileName = Student.class.getResource("/sql/student/student-query.properties").getPath();
		prop = new CommonDao().propLoad(fileName);
	}

	public int getListCount(Connection conn) {
		int listCount = 0;

		Statement stmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getListCount");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
		}

		return listCount;
	}

	public ArrayList<Student> studentList(Connection conn, PageInfo pi) {
		ArrayList<Student> list = new ArrayList<Student>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("studentList");

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Student(rset.getString("S_ID"), rset.getString("S_NAME"), rset.getInt("S_LEVEL"),
						rset.getString("DEPT_NAME"), rset.getString("C_NAME"), rset.getString("P_NAME")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertStudent(Connection conn, Student st) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertStudent");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, st.getUserId());
			// pstmt.setString(2, st.getPId());
			pstmt.setString(2, st.getCNo());
			pstmt.setString(3, st.getUserPwd());
			pstmt.setString(4, st.getUserName());
			pstmt.setInt(5, st.getsLevel());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<DropDown> getDList(Connection conn) {
		ArrayList<DropDown> dList = new ArrayList<DropDown>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getdList");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				dList.add(new DropDown(rset.getString("P_ID"), rset.getString("P_Name")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return dList;
	}

	public ArrayList<Student> getCList(Connection conn) {
		ArrayList<Student> cList = new ArrayList<Student>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getCList");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				cList.add(new Student(rset.getString("C_NO"), rset.getString("C_NAME")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cList;
	}

	public Student searchStudent(Connection conn, String search) {
		Student st = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("searchStudent");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				st = new Student(rset.getString("S_ID"), rset.getString("S_NAME"), rset.getInt("S_LEVEL"),
						rset.getString("DEPT_NAME"), rset.getString("C_NAME"), rset.getString("P_NAME"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return st;
	}

	public ArrayList<Fluctuation> fluctuationDetail(Connection conn, String userId) {
		ArrayList<Fluctuation> fl = new ArrayList<Fluctuation>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("fluctuationDetail");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				fl.add(new Fluctuation(rset.getInt("FL_NO"), rset.getString("S_ID"), rset.getString("FL_CHANGE"),
						rset.getString("FL_REASON"), rset.getInt("FL_YEAR"), rset.getInt("FL_SEMESTER"),
						rset.getDate("FL_DATE")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return fl;
	}

	public int updateFluctutation(Connection conn, Fluctuation fl) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateFluctutation");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fl.getFlChange());
			pstmt.setString(2, fl.getFlReason());
			pstmt.setString(3, fl.getsId());
			pstmt.setInt(4, fl.getFlNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<StudentConsulting> student_consultingList(Connection conn, String userId) {
		ArrayList<StudentConsulting> list = new ArrayList<StudentConsulting>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("student_consultingList");
		// student_consultingList=SELECT CS_NO, CS_CONTENTS, CS_DATE, CS_TIME, CS_WAY,
		// CS_TYPE FROM CONSULTING WHERE S_ID = ?

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new StudentConsulting(rset.getInt("CS_NO"), rset.getString("CS_CONTENTS"),
						rset.getDate("CS_DATE"), rset.getString("CS_TIME"), rset.getString("CS_WAY"),
						rset.getString("CS_TYPE")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public String searchAdvisor(Connection conn, String userId) {
		String advisor = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("searchAdvisor");
		/*
		 * SELECT P_NAME FROM PROFESSORS LEFT JOIN STUDENT ON PROFESSORS.P_ID =
		 * STUDENT.P_ID WHERE STUDENT.S_ID =?
		 */

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				advisor = rset.getString("P_NAME");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return advisor;
	}

	public ArrayList<StudentDivisionGrade> student_divisionGrade(Connection conn, String userId) {
		ArrayList<StudentDivisionGrade> list = new ArrayList<StudentDivisionGrade>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("student_divisionGrade");
		/*
		 * SELECT CLASS.CLASS_TYPE_NO, SUM(CLASS.CREDIT) FROM CLASS LEFT JOIN
		 * CLASS_HISTORY ON CLASS_HISTORY.CLASS_NO=CLASS.CLASS_NO WHERE
		 * CLASS_HISTORY.S_ID=? GROUP BY CLASS.CLASS_TYPE_NO;
		 */

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new StudentDivisionGrade(rset.getInt("TYPENO"), rset.getInt("CREDIT")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<StudentSemeterGrade> student_semesterGrade(Connection conn, String userId) {
		ArrayList<StudentSemeterGrade> SList = new ArrayList<StudentSemeterGrade>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql1 = prop.getProperty("student_semesterGrade");
		/*			
			SELECT YEAR, SEMESTER, CREDIT, CG_POINT, PERCENT FROM VIEW_ST_APPLI WHERE S_ID=?
			int year, int semester, int appliCredit, double avgCredit, double percent
		 */
		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				SList.add(new StudentSemeterGrade(rset.getInt("YEAR"),
												  rset.getInt("SEMESTER"),
												  rset.getInt("CREDIT"),
												  rset.getDouble("CG_POINT"),
												  rset.getDouble("PERCENT")));
				System.out.println(SList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return SList;
	
	}
	
  
	public int idCheck(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("idCheck");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = rset.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		return result;
	}

	public int updateStudent(Connection conn, Student st) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateStudent");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, st.getPId());
			pstmt.setString(2, st.getUserId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int pIdCheck(Connection conn, String pId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("pIdCheck");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, pId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = rset.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		return result;
	}

	public int insertFluctuation(Connection conn, Fluctuation fl) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFluctuation");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, fl.getFlNo());
			pstmt.setString(2, fl.getsId());
			pstmt.setString(3, fl.getFlChange());
			pstmt.setString(4, fl.getFlReason());
			pstmt.setInt(5, fl.getFlYear());
			pstmt.setInt(6, fl.getFlSemester());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public ArrayList<StudentEarnCredit> student_earnCredit(Connection conn, String userId) {
		ArrayList<StudentEarnCredit> EList = new ArrayList<StudentEarnCredit>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql1 = prop.getProperty("student_earnCredit");
		/*			
			SELECT SUM(C.CREDIT) FROM CLASS C JOIN CLASS_HISTORY H ON C.CLASS_NO=H.CLASS_NO WHERE H.S_ID=? AND H.CG_POINT IS NOT NULL GROUP BY C.CLASS_YEAR,C.CLASS_SEMESTER
			SELECT CREDIT FROM VIEW_ST_EARN WHERE S_ID=?
		 */
		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				EList.add(new StudentEarnCredit(rset.getInt("CREDIT")));
				System.out.println(EList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return EList;
	}

	public ArrayList student_rank(Connection conn, String userId, int year, int semester) {
		ArrayList rank = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("student_rank");
		/*
		 	SELECT DENSE_RANK()OVER(ORDER BY NVL(C.AVG,0)) "RANK"
			FROM STUDENT S
			LEFT JOIN VIEW_ST_COUNT C ON S.S_ID = C.S_ID
			WHERE C.YEAR=? AND C.SEMESTER=? AND S.C_NO =(SELECT C_NO
		                                                 FROM STUDENT
		                                                 WHERE S_ID=?
		 */
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(3, userId);
			pstmt.setInt(1, year);
			pstmt.setInt(2, semester);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				rank.add(new ArrayList(rset.getInt("RANK")));
				System.out.println(rank);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rank;
	}


}

