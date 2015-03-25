package com.amzi.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;

/**
 * Servlet implementation class billingServlet
 */
@WebServlet("/billingServlet")
public class billingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public billingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Map<String,String> billingInfo = new HashMap<String,String>();
		billingInfo.put("userFirstName",request.getParameter("userFirstName"));
		billingInfo.put("userLastName",request.getParameter("userLastName"));
		billingInfo.put("userAddress",request.getParameter("userAddress"));
		billingInfo.put("userCity",request.getParameter("userCity"));
		billingInfo.put("userCountry",request.getParameter("userCountry"));
		billingInfo.put("userPostalCode",request.getParameter("userPostalCode"));
		billingInfo.put("userEmail",request.getParameter("userEmail"));
		billingInfo.put("userPhone",request.getParameter("userPhone"));
		billingInfo.put("card",request.getParameter("card"));
		billingInfo.put("month",request.getParameter("month"));
		billingInfo.put("year",request.getParameter("year"));
		session.setAttribute("billingInfo",billingInfo);
		request.getRequestDispatcher("checkout.jsp").forward(request, response);
	}

}
