package org.techexercise.dto;

import java.util.List;

import org.techexercise.domain.Order;

public class OrderListDto {

	private List<Order> orders;

	//getters and setters
	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
}
