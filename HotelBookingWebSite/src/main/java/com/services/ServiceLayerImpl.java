package com.services;

import org.springframework.beans.factory.annotation.Autowired;

import com.dao.DaoLayerImpl;
import com.entities.UserDetails;

public class ServiceLayerImpl implements Servicelayer {
	
	@Autowired
	private DaoLayerImpl dao;
	
	
	@Override
	public boolean insertData(UserDetails details) {
		// System.out.println("Details Of Service "+details);
		if(dao.insertData(details)) {
			return true;
		}
		return false;
	}


	@Override
	public UserDetails getUserDetails(String email, String password) {
		
		return dao.getUserDetails(email, password);
	}


	@Override
	public boolean updatePassword(String email, String password) {
		return dao.updatePassword(email, password);
	}


	@Override
	public boolean updateDetails(UserDetails details) {
		return dao.updateDetails(details);
	}


	@Override
	public boolean updateDetails1(UserDetails details) {
		return dao.updateDetails1(details);
	}

}
