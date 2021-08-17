package com.sun.student.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.student.model.service.StudentService;
import com.sun.student.model.vo.Student;

/**
 * Servlet implementation class StInsert
 */
@WebServlet("/insert.st")
public class StudentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId= request.getParameter("userId");
		String userPwd= request.getParameter("userPwd");
		String userName= request.getParameter("userName");
		String pId= request.getParameter("pId");
		String cNo= request.getParameter("cNo");
		
		ArrayList<Student> pList = new StudentService().getPList();
		ArrayList<Student> cList = new StudentService().getCList();
		request.setAttribute("pList", pList);
		request.setAttribute("cList", cList);
		
		Student st = new Student(userId,userPwd,userName,pId,cNo);
		
		int result = new StudentService().insertStudent(st);
		
		if(result>0) {
			request.getSession().setAttribute("msg", "학생 등록 성공");
			response.sendRedirect(request.getContextPath());
		}
		else {
			request.setAttribute("msg", "학생 등록 실패");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}