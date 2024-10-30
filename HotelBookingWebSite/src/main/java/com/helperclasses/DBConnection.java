package com.helperclasses;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	private  Connection con;
	
	public  Connection getConnection() {
		try {
			if(con == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con= DriverManager.getConnection("jdbc:mysql://localhost:3306/HotelBookingSystem","root","1808");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

}
