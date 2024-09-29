package com.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.Entities.Product;

@Component
@Repository
public class ProductDaoImpl implements ProductDao {
	
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	@Transactional
	public void insertProduct(Product product) {
		hibernateTemplate.saveOrUpdate(product);
		
	}

	@Override
	@Transactional
	public List<Product> getProducts() {
		// TODO Auto-generated method stub
		return hibernateTemplate.loadAll(Product.class);
	}

	@Override
	@Transactional
	public void deleteProduct(int id) {
		Product details = hibernateTemplate.load(Product.class,id);
		hibernateTemplate.delete(details);
		
	}

	@Override
	@Transactional
	public Product getProduct(int id) {
		Product details = hibernateTemplate.load(Product.class,id);
		System.out.println(details.getName());
		return details;
	}
	
	
	
	
	
	
}
