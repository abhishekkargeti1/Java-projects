package com.dao;

import com.entities.UserDetails;

public interface Daolayer {
	
	public boolean insertData(UserDetails details);
	
	public UserDetails getUserDetails(String email,String password);

}	
