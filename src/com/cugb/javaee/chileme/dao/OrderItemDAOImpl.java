package com.cugb.javaee.chileme.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.chileme.bean.OrderItem;
import com.cugb.javaee.chileme.dao.baseDAO;

public class OrderItemDAOImpl extends baseDAO implements OrderItemDAO {

	@Override
	public int addOrderItem(OrderItem orderItem) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "insert into OrderItem values(?, ?, ?, ?)";
		Object[] params = {orderItem.getDishid(),orderItem.getOrderid(),orderItem.getCount(),orderItem.getFinalprice()};
		return modifyObj(sql, params);
	}

	@Override
	public ArrayList findOrderItems(String orderId) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select dishid Dishid, orderid Orderid, count Count, finalPrice Finalprice from OrderItem where orderid = '"+orderId+"'";
		return findObjs(sql, OrderItem.class);
	}

}
