package org.techexercise.controller;

import org.techexercise.domain.Order;
import org.techexercise.dto.OrderListDto;
import org.techexercise.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/orders")
public class OrderController {

	@Autowired
	private OrderService service;
	
	@RequestMapping
	public String getOrdersPage() {
		return "orders";
	}
	
	@RequestMapping(value="/records")
	public @ResponseBody OrderListDto getOrders() {
		
		OrderListDto orderListDto = new OrderListDto();
		orderListDto.setOrders(service.readAll());
		return orderListDto;
	}
	
	@RequestMapping(value="/get")
	public @ResponseBody Order get(@RequestBody Order order) {
		return service.read(order);
	}

	@RequestMapping(value="/create", method=RequestMethod.POST)
	public @ResponseBody Order create(
			@RequestParam Integer orderNo,
			@RequestParam String firstName,
			@RequestParam String lastName,
			@RequestParam String part,
			@RequestParam Integer quantity,
			@RequestParam Double price) {
		
		Order newOrder = new Order();
		newOrder.setOrderNo(orderNo);
		newOrder.setFirstName(firstName);
		newOrder.setLastName(lastName);
		newOrder.setPart(part);
		newOrder.setQuantity(quantity);
		newOrder.setPrice(price);
		
		return service.create(newOrder);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody Order update(
			@RequestParam Integer orderNo,
			@RequestParam String firstName,
			@RequestParam String lastName,
			@RequestParam String part,
			@RequestParam Integer quantity,
			@RequestParam Double price) {
		
		Order existingOrder = new Order();
		existingOrder.setOrderNo(orderNo);
		existingOrder.setFirstName(firstName);
		existingOrder.setLastName(lastName);
		existingOrder.setPart(part);
		existingOrder.setQuantity(quantity);
		existingOrder.setPrice(price);
		
		return service.update(existingOrder);
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public @ResponseBody Boolean delete(
			@RequestParam Integer orderNo) {

		Order existingOrder = new Order();
		existingOrder.setOrderNo(orderNo);
		
		return service.delete(existingOrder);
	}
}
