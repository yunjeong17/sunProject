package com.sun.classes.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.classes.model.service.ClassService;
import com.sun.classes.model.vo.Classes;


/**
 * Servlet implementation class ClassInsert
 */
@WebServlet("/insert.class")
public class ClassInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String classNo= request.getParameter("classNo");
		String className= request.getParameter("className");
		String classPlace= request.getParameter("classPlace");
		String classTypeNoin= request.getParameter("classTypeNoin");
		String pId= request.getParameter("pId");
		String classYearin= request.getParameter("classYearin");
		String classSemesterin= request.getParameter("classSemesterin");
		
		int classTypeNo = 0;
			if(classTypeNoin != null) {
				classTypeNo = Integer.parseInt(classTypeNoin);
			}
			
		int classYear = 0;
			if(classYearin != null) {
				classYear = Integer.parseInt(classYearin);
			}
		
		int classSemester = 0;
			if(classSemesterin != null) {
				classSemester = Integer.parseInt(classSemesterin);
			}
		
		
		
		Classes classes = new Classes();
	
		classes.setClassNo(classNo);
		classes.setClassName(className);
		classes.setClassPlace(classPlace);
		classes.setClassTypeNo(classTypeNo);
		classes.setpId(pId);
		classes.setClassYear(classYear);
		classes.setClassSemester(classSemester);
		
		
		int result = new ClassService().insertClasses(classes);
		
		if(result>0) {
			request.getSession().setAttribute("msg", "강의 등록 성공");
			response.sendRedirect(request.getContextPath());
		}
		else {
			request.setAttribute("msg", "강의 등록 실패");
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
