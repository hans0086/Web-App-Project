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
 * Servlet implementation class addToCart
 */
@WebServlet("/addToCart")
public class addToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		ArrayList<String> cartList = new ArrayList<String>();
		cartList = (ArrayList<String>) session.getAttribute("cartItemArray");
		int cart_count = (int)session.getAttribute("cart_count");
		session.setAttribute("cart_count",++cart_count);
		cartList.add(request.getParameter("title") + "_" + cart_count);
		session.setAttribute("cartItemArray", cartList);
		request.getRequestDispatcher("shoppingCart.jsp").forward(request, response);		
	}

}
