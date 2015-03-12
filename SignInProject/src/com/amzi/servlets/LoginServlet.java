package com.amzi.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.amzi.dao.LoginAdminDao;
import com.amzi.dao.LoginDao;
import com.security.Security;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String n = request.getParameter("username");
		String p = Security.hashPassword(request.getParameter("userpass"));
		HttpSession session = request.getSession(false);
		RequestDispatcher rd;
		
		if (session != null)
			session.setAttribute("name", n);

		if (LoginDao.validate(n, p)) {
			if (LoginAdminDao.validate(n, p).equals("y")) {
				rd = request.getRequestDispatcher("admin.jsp");
			}
			else
				rd = request.getRequestDispatcher("welcome.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("error", "Error: Username or Password incorrect");
			rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}

		out.close();
	}
}