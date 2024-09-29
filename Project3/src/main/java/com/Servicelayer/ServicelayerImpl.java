package com.Servicelayer;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Service;

import com.Entities.Product;
import com.dao.ProductDaoImpl;

@Service
public class ServicelayerImpl implements Servicelayer{
	
	@Autowired
	ProductDaoImpl productDaoImpl;
	
	@Override
	public void insertProduct(Product product) {
		productDaoImpl.insertProduct(product);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProduct(int id) {
		productDaoImpl.deleteProduct(id);
		// TODO Auto-generated method stub
		
	}

	@Override
	@Transactional
	public Product getProduct(int id) {
		
		return productDaoImpl.getProduct(id);
	}

	@Override
	public List<Product> getProducts() {
		
		return productDaoImpl.getProducts();
	}

}
