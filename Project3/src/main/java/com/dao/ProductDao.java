package com.dao;

import java.util.List;

import com.Entities.Product;

public interface ProductDao {
	public void insertProduct(Product product);
	public void deleteProduct(int id);
	public Product getProduct(int id);
	public List<Product> getProducts();
}
