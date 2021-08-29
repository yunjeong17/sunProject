package com.sun.classes.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.classes.model.service.ClassService;
import com.sun.professors.model.service.ProfessorsService;

/**
 * Servlet implementation class ClassDelete
 */
@WebServlet("/delete.class")
public class ClassDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classNo=request.getParameter("classNo");

 		int result = new ClassService().deleteClasses(classNo);

 		if(result>0) {
 			HttpSession session= request.getSession();
 			session.setAttribute("msg", "강의 삭제를 완료했습니다.");
 			response.sendRedirect("list.class");
 		}else {
 			request.setAttribute("msg", "강의 삭제를 실패했습니다.");
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
