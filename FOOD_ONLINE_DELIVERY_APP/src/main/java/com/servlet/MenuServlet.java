package com.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.daoimpl.MenuImpl;
import com.daomodel.Menu;


@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 int id=Integer.parseInt(request.getParameter("restaurant_id"));
		MenuImpl Mimpl=new MenuImpl();
		List<Menu> M_list_By_Res=Mimpl.getAllMenusByRestaurantId(id);
		request.setAttribute("Menu_details", M_list_By_Res);
		RequestDispatcher rd=request.getRequestDispatcher("menu.jsp");
		rd.forward(request, response);
		
		for(Menu menu : M_list_By_Res) {
			System.out.println(menu);
		}
	
	
	}



}
