package com.sun.professors.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.professors.model.service.ProfessorsService;
import com.sun.professors.model.vo.Professors;
;

/**
 * Servlet implementation class ProfessorsUpdate
 */
@WebServlet("/update.prof")
public class ProfessorsUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfessorsUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		 
		String userId= request.getParameter("userId");
		String pId= request.getParameter("pId");
		
		Professors prof = new Professors();
		prof.setUserId(userId);
		
		
		int updatest = new ProfessorsService().updateProfessors(prof);
		
		if(updatest > 0) {
			request.getSession().setAttribute("msg", "교수 정보 수정을 성공했습니다.");
			response.sendRedirect("list.prof");
			
		}else {
			request.setAttribute("msg", "교수 정보 수정을 실패했습니다.");
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
