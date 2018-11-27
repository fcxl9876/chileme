package com.cugb.javaee.chileme.test;

import static org.junit.Assert.*;

import java.util.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

import com.cugb.javaee.chileme.bean.Order;
import com.cugb.javaee.chileme.bean.OrderItem;
import com.cugb.javaee.chileme.dao.OrderDAO;
import com.cugb.javaee.chileme.utils.DAOFactory;

public class OrderDAOMySqlImplTest{
	
	OrderDAO orderdao = null;
	@Before
	public void setUp() throws Exception {
		orderdao = (OrderDAO) DAOFactory.newInstance("OrderDAO");
	}

	@Test
	public void testFindOrders() throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		//fail("Not yet implemented");
		ArrayList<Order> arrayList = null;

		arrayList = orderdao.findOrders("1001");
		for(Order order: arrayList){
		}
		

		
	}
}
