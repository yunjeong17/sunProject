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
import com.sun.student.model.vo.Student;
import com.sun.student.model.vo.PageInfo;

public class StudentDao {
	
	private Properties prop;
	
	public StudentDao() {
		// TODO Auto-generated constructor stub
		String fileName = Student.class.getResource("/sql/student/student-query.properties").getPath();
		prop= new CommonDao().propLoad("Student",fileName);
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
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Student(rset.getString("S_ID")
						,rset.getString("S_NAME")
						,rset.getInt("S_LEVEL")
						,rset.getString("DEPT_NAME")
						,rset.getString("C_NAME")
						,rset.getString("P_NAME")
						));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertStudent(Connection conn, Student st) {
		int result=0;
		PreparedStatement pstmt= null;
		String sql = prop.getProperty("insertStudent");
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, st.getUserId());
			pstmt.setString(2, st.getPId());
			pstmt.setString(3, st.getCNo());
			pstmt.setString(4, st.getUserPwd());
			pstmt.setString(5, st.getUserName());
			pstmt.setInt(6, st.getsLevel());

			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Student> getPList(Connection conn) {
		ArrayList<Student> pList = new ArrayList<Student>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("getPList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				pList.add(new Student(rset.getString("P_ID")
						,rset.getString("P_NAME")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(rset);
			close(pstmt);
		}
		return pList;
	}

	public ArrayList<Student> getCList(Connection conn) {
		ArrayList<Student> cList = new ArrayList<Student>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("getCList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				cList.add(new Student(rset.getString("C_NO")
						,rset.getString("C_NAME")
						,rset.getInt("DEPT_NO")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
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
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				st = new Student(rset.getString("S_ID")
						,rset.getString("S_NAME")
						,rset.getInt("S_LEVEL")
						,rset.getString("DEPT_NAME")
						,rset.getString("C_NAME")
						,rset.getString("P_NAME")
						);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(rset);
			close(pstmt);
		}
		return st;
	}

	
}
