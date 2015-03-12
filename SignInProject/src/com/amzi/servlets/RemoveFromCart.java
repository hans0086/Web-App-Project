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
 * Servlet implementation class RemoveFromCart
 */
@WebServlet("/RemoveFromCart")
public class RemoveFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveFromCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (request.getParameter("removeFromCart") != null) {
			ArrayList<String> cartList = new ArrayList<String>();
			cartList = (ArrayList<String>)session.getAttribute("cartItemArray");
			String value = request.getParameter("cart_id");
			for(int i = 0;i < cartList.size();++i)
			{
				String cartItem = cartList.get(i);
				if(cartItem.equals(value))
				{
					cartList.remove(i);
					break;
				}	
			}
			session.setAttribute("cartItemArray", cartList);			
		}
		
		 request.getRequestDispatcher("shoppingCart.jsp").include(request, response);
	}

}