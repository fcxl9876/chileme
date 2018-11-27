package com.cugb.javaee.chileme.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cugb.javaee.chileme.bean.Dish;
import com.cugb.javaee.chileme.dao.DishDAO;
import com.cugb.javaee.chileme.utils.DAOFactory;

/**
 * Servlet implementation class DishAddControl
 */
@WebServlet("/DishAddControl")
public class DishAddControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DishAddControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Dish dish = new Dish();
		dish.setDescri(request.getParameter("description"));
		dish.setDiscount(Float.parseFloat(request.getParameter("discount")));
		dish.setImgurl(request.getParameter("imgurl"));
		dish.setPrice(Float.parseFloat(request.getParameter("price")));
		dish.setDishname(request.getParameter("dishname"));
		DishDAO disDAO = null;
		try {
			disDAO = (DishDAO) DAOFactory.newInstance("DishDAO");
			disDAO.addDish(dish);
			response.sendRedirect("action?actiontype=detail&dishid="+String.valueOf(disDAO.findMaxDish().getDishid()));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
