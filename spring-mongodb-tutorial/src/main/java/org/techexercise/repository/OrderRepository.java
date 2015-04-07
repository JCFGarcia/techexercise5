package org.techexercise.repository;

import org.techexercise.domain.Order;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface OrderRepository extends MongoRepository<Order, Integer> {
	
	Order findByOrderNo(int orderNo);
}
