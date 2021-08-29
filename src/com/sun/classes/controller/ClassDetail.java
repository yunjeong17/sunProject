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
 * Servlet implementation class ClassDetail
 */
@WebServlet("/detail.class")
public class ClassDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classNo = request.getParameter("classNo");
		String className = request.getParameter("className"); 
		String classPlace = request.getParameter("classPlace"); 
		String classTypeNo = request.getParameter("classTypeNo");
		String pId = request.getParameter("pId");
		String classYear = request.getParameter("classYear");
		String classSemester = request.getParameter("classSemester");
		
		Classes classes = new ClassService().ClassesDetail(classNo);
		
				
		if(classes != null) {
			request.setAttribute("classes", classes);
			

			request.getRequestDispatcher("views/admin/classes/classDetail.jsp").forward(request, response);
		}else {
			
			request.setAttribute("msg", "게시물 상세 조회를 실패했습니다.");
			RequestDispatcher view= request.getRequestDispatcher("views/common/errorPage.jsp");
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
