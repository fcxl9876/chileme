package com.cugb.javaee.chileme.test;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

import com.cugb.javaee.chileme.bean.OrderItem;
import com.cugb.javaee.chileme.dao.OrderItemDAO;
import com.cugb.javaee.chileme.utils.DAOFactory;

public class OrderItemDAOMySqlImplTest {

	OrderItemDAO orderitemdao = null;
	@Before
	public void setUp() throws Exception {
		orderitemdao = (OrderItemDAO) DAOFactory.newInstance("OrderItemDAO");
	}

	@Test
	public void test() throws SQLException {
		String oid = "1496294184681manyfun711";
		ArrayList<OrderItem> oit = orderitemdao.findOrderItems(oid);
		
	}

}
