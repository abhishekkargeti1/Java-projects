package com.services;

import com.entities.UserDetails;

public interface Servicelayer {
	public boolean insertData(UserDetails details);
	
	public UserDetails getUserDetails(String email,String password);
	
	public boolean updatePassword(String email,String password);
}
