package com.cugb.javaee.chileme.bean;

public class OrderItem {
	public int dishid;
	public String orderid;
	public int count;
	public float finalPrice;
	
	public int getDishid() {
		return dishid;
	}
	public void setDishid(int dishid) {
		this.dishid = dishid;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public float getFinalprice() {
		return finalPrice;
	}
	public void setFinalprice(float finalprice) {
		this.finalPrice = finalprice;
	}
}
