package com.cugb.javaee.chileme.test;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.junit.Before;
import org.junit.Test;

import com.cugb.javaee.chileme.dao.CustomerDAO;
import com.cugb.javaee.chileme.bean.Customer;
import com.cugb.javaee.chileme.dao.CustomerDAO;
import com.cugb.javaee.chileme.utils.DAOFactory;

public class CustomerDAOImplTest {

	CustomerDAO cusDAO = null;
	
	@Before
	public void setUp() throws Exception {
		cusDAO = (CustomerDAO)DAOFactory.newInstance("CustomerDAO");
	}

	@Test
	public void testAddCustomer() throws SQLException {
		Customer cus = new Customer();
		cus.setUsername("1003");
		cus.setPassword("admin");
		cus.setEmail("cus1003");
		assertEquals(1, cusDAO.addCustomer(cus));
	}

}
