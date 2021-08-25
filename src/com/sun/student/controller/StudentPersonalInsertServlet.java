package com.sun.student.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.student.model.service.StudentService;
import com.sun.student.model.vo.Student;
import com.sun.user.model.vo.User;

/**
 * Servlet implementation class StudentPersonalInsertServlet
 */
@WebServlet("/stPersonal.save")
public class StudentPersonalInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentPersonalInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		User user=(User)request.getSession().getAttribute("loginUser");
		
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String military = request.getParameter("military");
		String address = request.getParameter("address");
		String account = request.getParameter("account");
		String bank = request.getParameter("bank");
		String holder = request.getParameter("holder");
		
		Student stp = new Student();
		stp.setsPhone(phone);
		stp.setsEmail(email);
		stp.setMilitary(military);
		stp.setAddress(address);
		stp.setAccount(account);
		stp.setBank(bank);
		stp.setHolder(holder);

		int result = new StudentService().stPersonalInsert(user.getUserId(), stp);
		PrintWriter out = response.getWriter();
		if(result>0) {
			out.print("success");
			
		}else {
			out.print("fail");
			
		}
		out.flush();
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
