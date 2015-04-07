package org.techexercise.service;

import java.util.List;
import java.util.UUID;

import org.techexercise.domain.Order;
import org.techexercise.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;
	
	public Order create(Order order) {
		order.setId(UUID.randomUUID().toString());
		return orderRepository.save(order);
	}
	
	public Order read(Order order) {
		return order;
	}
	
	public List<Order> readAll() {
		return orderRepository.findAll();
	}
	
	public Order update(Order order) {
		Order existingOrder = orderRepository.findByOrderNo(order.getOrderNo());
		
		if (existingOrder == null) {
			return null;
		}
		
		existingOrder.setFirstName(order.getFirstName());
		existingOrder.setLastName(order.getLastName());
		existingOrder.setPart(order.getPart());
		existingOrder.setQuantity(order.getQuantity());
		existingOrder.setPrice(order.getPrice());
		
		return orderRepository.save(existingOrder);
	}
	
	public Boolean delete(Order order) {
		Order existingOrder = orderRepository.findByOrderNo(order.getOrderNo());
		
		if (existingOrder == null) {
			return false;
		}
		
		orderRepository.delete(existingOrder);
		return true;
	}
}
