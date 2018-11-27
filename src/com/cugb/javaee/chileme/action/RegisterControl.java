package com.cugb.javaee.chileme.action;

import java.lang.Math;
import java.net.URLEncoder;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.cugb.javaee.chileme.bean.Customer;
import com.cugb.javaee.chileme.biz.CustomerService;
import com.cugb.javaee.chileme.dao.CustomerDAOImpl;

/**
 * 
 * @author fcxl9876
 * �û�ע��servlet
 * 2018��11��20��
 */
@WebServlet("/register")
public class RegisterControl extends baseControl {

	
	public RegisterControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		//��ȡ����
		String username = req.getParameter("registerName");
		String password = req.getParameter("registerPass");
		String email = req.getParameter("registerEmail");
		Customer customer = new Customer();
		customer.setUsername(username);
		customer.setPassword(password);
		customer.setEmail(email);
		//�ж��Ƿ��ͻ�󣬽��û��洢�����ݿ���
		CustomerService cService = new CustomerService();
		RequestDispatcher rd = null;
		try {
			if(cService.isExistCustomer(username)){
				//����û��Ѵ���
				PrintWriter out = resp.getWriter();
				String a = URLEncoder.encode("�û��Ѿ����ڣ�", "UTF-8");  
		        out.print("<script>alert(decodeURIComponent('"+a+"') );window.location.href='login.jsp'</script>"); 
				
				//resp.sendRedirect("login.html");
			}
			else{
				//ע��ɹ�
				CustomerDAOImpl cuMySqlImpl = new CustomerDAOImpl();
				cuMySqlImpl.addCustomer(customer);
				String a = URLEncoder.encode("ע��ɹ� ���½��", "UTF-8");  
				resp.getWriter().print("<script>alert(decodeURIComponent('"+a+"') );window.location.href='login.jsp'</script>");
			}
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
}
