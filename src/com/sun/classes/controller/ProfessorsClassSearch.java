package com.sun.classes.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.classes.model.service.ClassService;
import com.sun.classes.model.vo.Classes;

/**
 * Servlet implementation class ProfessorsClassSearch
 */
@WebServlet("/searchClass.pr")
public class ProfessorsClassSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfessorsClassSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cName= request.getParameter("cName");
		String year= request.getParameter("year");
		String semester= request.getParameter("semester");
		
		String userId= request.getParameter("userId");
		
		Classes c= new Classes();
		c.setClassName(cName);
		c.setClassYear(Integer.parseInt( year));
		c.setClassSemester(Integer.parseInt(semester));
		
		ArrayList<Classes> list = new ClassService().selectClassListSearch(userId,c);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/professors/class/professorsClassListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
