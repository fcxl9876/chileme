package com.cugb.javaee.chileme.action;

import com.cugb.javaee.chileme.test.*;
import com.cugb.javaee.chileme.bean.*;
import com.cugb.javaee.chileme.biz.*;
import com.cugb.javaee.chileme.dao.DishDAO;
import com.cugb.javaee.chileme.utils.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.DefaultCaret;
import javax.websocket.Session;

import org.apache.catalina.filters.AddDefaultCharsetFilter;
import org.eclipse.jdt.internal.compiler.env.IGenericField;
import org.omg.CORBA.INTERNAL;

import com.cugb.javaee.chileme.utils.DAOFactory;
import com.sun.xml.internal.ws.resources.HttpserverMessages;


/**
 * Servlet implementation class ActionControl
 */
public class ActionControl extends baseControl {
	private static final long serialVersionUID = 1L;
	private String searchTH;
	private static Properties prop = null;
	private Map cart = new HashMap();
	private int pageSize = 10;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ActionControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String actiontype = request.getParameter("actiontype");
		switch (actiontype) {
		case "detail":
			try {
				showdetail(request, response);
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		// ��ʾĳһ����Ʒ����ϸ��Ϣ
		case "cart":
			try {
				addCart(request, response);
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "del":
			delCart(request, response);
		    break;
		case "addone":
			try {
				addOne(request, response);
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "goCart":
			goCart(request,response);
			break;
			// ��ӵ����ﳵ
		case "logOut":
			logOut(request,response);
			break;
		case "search":
			try {
				search(request, response);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}

	}

	private void search(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, NumberFormatException, InstantiationException, IllegalAccessException, ClassNotFoundException{
		String In = request.getParameter("query");
		String kw;
		if(In.equals("-1")){
			kw = searchTH;
		}
		else{
			System.out.println(In+" this is In");
			searchTH = In;
			kw = searchTH;
		}
		// ��ȡ��ǰҳ��
		int pageNo = Integer.parseInt(request.getParameter("pageNO"));
		System.out.println(pageNo + "now page");
		// int pageSize = Integer.parseInt(prop.getProperty("pageSize"));
		// ��ҳ��ѯ
		 String pageSize = ConfigFactory.readProperty("pageSize");
		// ����pageModel����
		DishService dishserv = new DishService();
		System.out.println(kw + "  111");
		PageModel<Dish> pagemodel = dishserv.findDish5PageList(pageNo, Integer.parseInt(pageSize), kw);
		// ��ת��showҳ��
		// logger.debug(pagemodel.getList());
		request.setAttribute("dishlist", pagemodel.getList());
		System.out.println(pagemodel.getTotalPages() + " ��ҳ��");
		System.out.println(pagemodel.getList().size() + "��С");
		request.setAttribute("pageModel", pagemodel);
		request.setAttribute("qs", kw);
		RequestDispatcher rd = request
				.getRequestDispatcher("search.jsp?pageNO=" + pageNo + "&totalpages=" + pagemodel.getTotalPages());
		rd.forward(request, response);
	
		
	}
	
	private void showdetail(HttpServletRequest request, HttpServletResponse response) throws InstantiationException,
		    IllegalAccessException, ClassNotFoundException, SQLException, ServletException, IOException {
	
		String Did = request.getParameter("dishid");
		Dish current = new Dish();
		DishDAO dishdao = (DishDAO) DAOFactory.newInstance("DishDAO");
		int id = Integer.parseInt(Did);
		current = dishdao.findDish(id);
		request.setAttribute("current", current);
		request.getRequestDispatcher("showdetails.jsp").forward(request, response);
	}

	private void addCart(HttpServletRequest request, HttpServletResponse response) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException, ServletException, IOException {
		HttpSession session = request.getSession(true);
		CartItem nc = new CartItem();
		if (session.getAttribute("loginuser") == null) {
			response.sendRedirect("login.jsp"); 
		} else {
			String nn = (request.getParameter("number"));
			String Did = request.getParameter("dishid");
			Dish current = new Dish();
		
			DishDAO dishdao = (DishDAO) DAOFactory.newInstance("DishDAO");
			int id = Integer.parseInt(Did);
			current = dishdao.findDish(id);
			request.setAttribute("current", current);
			int number = Integer.parseInt(nn);
			Customer now = (Customer) session.getAttribute("loginuser");
			nc.setUsername(now.getUsername());
			nc.setId(id);
			Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
			int flag = 0;
			while(it.hasNext()){
			Map.Entry entry = (Map.Entry) it.next();
			CartItem ncin = new CartItem();
			ncin = (CartItem)entry.getKey();
			if (nc.getId()==ncin.getId()&&nc.getUsername()==ncin.getUsername()) {
				flag = 1;
				cart.put(ncin, (Integer) cart.get(ncin) + number);
			   } 
			}
			if(flag==0){
					cart.put(nc, number);
			}
			session.setAttribute("shopcart", cart);
		    response.sendRedirect("cart.jsp");   
		}
	}

	private void delCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String Did = request.getParameter("dishid");
		Customer now = (Customer) session.getAttribute("loginuser");
		session.setAttribute("shopcart", cart);
		Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
		while(it.hasNext())
		{
			Map.Entry entry = (Map.Entry) it.next();
			CartItem ncin = new CartItem();
			ncin = (CartItem)entry.getKey();
			if (ncin.getId()==Integer.parseInt(Did)&&ncin.getUsername()==now.getUsername()) {
			
				cart.remove(ncin);
				break;
			   } 
			}
		response.sendRedirect("cart.jsp");
	}

	private void addOne(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException{
		HttpSession session = request.getSession(true);
		CartItem nc = new CartItem();
		if (session.getAttribute("loginuser") == null) {
			response.sendRedirect("login.jsp");
		} else {
			String Did = request.getParameter("dishid");
			Dish current = new Dish();
			DishDAO dishdao = (DishDAO) DAOFactory.newInstance("DishDAO");
			int id = Integer.parseInt(Did);
			current = dishdao.findDish(id);
			request.setAttribute("current", current);
			Customer now = (Customer) session.getAttribute("loginuser");
			nc.setUsername(now.getUsername());
			nc.setId(id);
			Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
			int flag = 0;
			while(it.hasNext()){
			Map.Entry entry = (Map.Entry) it.next();
			CartItem ncin = new CartItem();
			ncin = (CartItem)entry.getKey();
			if (nc.getId()==ncin.getId()&&nc.getUsername()==ncin.getUsername()) {
				flag = 1;
				cart.put(ncin, (Integer) cart.get(ncin) + 1);
			   } 
			}
			if(flag==0){
					cart.put(nc, 1);
			}
			session.setAttribute("shopcart", cart);
			response.sendRedirect("cart.jsp");
		}
		
	}
	private void goCart(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession(true);
		if(session.getAttribute("loginuser")==null){
			response.sendRedirect("login.jsp");
		}
		else{
			response.sendRedirect("cart.jsp");
		}
	}
	private void logOut(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession(true);
		session.removeAttribute("loginuser");
		response.sendRedirect("index.jsp");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
