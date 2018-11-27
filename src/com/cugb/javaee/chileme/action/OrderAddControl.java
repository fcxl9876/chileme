package com.cugb.javaee.chileme.action;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cugb.javaee.chileme.bean.CartItem;
import com.cugb.javaee.chileme.bean.Customer;
import com.cugb.javaee.chileme.bean.Dish;
import com.cugb.javaee.chileme.bean.Order;
import com.cugb.javaee.chileme.bean.OrderItem;
import com.cugb.javaee.chileme.dao.DishDAO;
import com.cugb.javaee.chileme.dao.OrderDAO;
import com.cugb.javaee.chileme.utils.DAOFactory;

/**
 * Servlet implementation class OrderAddControl
 */
@WebServlet("/OrderAddControl")
public class OrderAddControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderAddControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		Order order = new Order();
		
		
		//Step1. ȡ�����й��ﳵ����Ϣ
		HttpSession session = request.getSession();
		Customer cus = (Customer) session.getAttribute("loginuser");
		java.util.Date today = new java.util.Date();
		Timestamp timestamp = new Timestamp(today.getTime());
		String orderID = String.valueOf((new java.util.Date()).getTime());
		
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		
		Map cart = (Map) session.getAttribute("shopcart");
		Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
		DishDAO ff = null;
		float totalPrice = 0.0f;
		int count = 0;
		ArrayList<OrderItem> arr = new ArrayList<OrderItem>();
		while(it.hasNext()){
			try {
				ff = (DishDAO)DAOFactory.newInstance("DishDAO");
				Map.Entry entry = (Map.Entry) it.next();
				
				CartItem nc = new CartItem();
				nc = (CartItem) entry.getKey();
				Customer cuss = (Customer) session.getAttribute("loginuser");
				if (!nc.getUsername().equals(cuss.getUsername())) {
					continue;
				}
				
				int dishid = nc.getId();
				int disnumber = (Integer) entry.getValue();
				
				Dish cur = ff.findDish(dishid);
				count += disnumber;
				OrderItem oit = new OrderItem();
				oit.setCount(disnumber);
				oit.setDishid(dishid);
				oit.setFinalprice(cur.getDiscount());
				oit.setOrderid(orderID);
				arr.add(oit);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//Step2. 
		order.setOrderid(orderID);
		order.setUsername(cus.getUsername());
		order.setTime(timestamp);
		order.setPaystatus("δ֧��");
		order.setItems(arr);
		order.setTel(tel);
		order.setAddress(address);
		
		order.updateCount();
		order.updateTotalPrice();
		
		OrderDAO orderdao;
		try {
			orderdao = (OrderDAO) DAOFactory.newInstance("OrderDAO");
			orderdao.addOrder(order);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Customer cuss = (Customer) session.getAttribute("loginuser");

		Iterator<Map.Entry<Integer, Integer>> itt = cart.entrySet().iterator();
		while(itt.hasNext())
		{
			
			//Iterator<Map.Entry<Integer, Integer>> itt2 = (Iterator<Entry<Integer, Integer>>) itt.next();
			Map.Entry entry = (Map.Entry) itt.next();
			CartItem ncin = new CartItem();
			ncin = (CartItem)entry.getKey();
			if (ncin.getUsername()==cuss.getUsername()) {
				itt.remove();
			}
			//itt = itt2;
			//response.sendRedirect("mine.jsp");
		}
		
		response.sendRedirect("mine.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
