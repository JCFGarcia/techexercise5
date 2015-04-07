package org.techexercise.service;

import java.util.UUID;
import org.techexercise.domain.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;

/**
 * Service for initializing MongoDB with sample data using {@link MongoTemplate}
 */
public class InitMongoService {
	
	@Autowired
	private MongoTemplate mongoTemplate;

	public void init() {
		// Create new records
		
		Order turbo = new Order();
		turbo.setId(UUID.randomUUID().toString());
		turbo.setOrderNo(12);
		turbo.setFirstName("Ayrton");
		turbo.setLastName("Senna");
		turbo.setPart("turbocharger");
		turbo.setQuantity(2);
		turbo.setPrice(347.98);
		
		// Insert to db
		mongoTemplate.insert(turbo, "testOrder");
	}
}
