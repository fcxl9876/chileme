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
 * Servlet implementation class DishModifyControl
 */

@WebServlet("/DishModifyControl")
public class DishModifyControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DishModifyControl() {
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
		dish.setDishid(Integer.parseInt(request.getParameter("dishID")));
		dish.setImgurl(request.getParameter("imgURL"));
		dish.setPrice(Float.parseFloat(request.getParameter("price")));
		dish.setDishname(request.getParameter("name"));
		try {
			DishDAO disDAO = (DishDAO) DAOFactory.newInstance("DishDAO");
			disDAO.modifyDish(dish);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("action?actiontype=detail&dishid="+String.valueOf(dish.getDishid()));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
