package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import org.springframework.beans.factory.annotation.Autowired;

import com.entities.UserDetails;
import com.helperclasses.DBConnection;

public class DaoLayerImpl implements Daolayer {

	@Autowired
	private DBConnection dbConnection;
	
	public DaoLayerImpl(DBConnection dbConnection) {
		super();
		this.dbConnection = dbConnection;
	}
	
	public DBConnection getCon() {
		return  dbConnection;
	}
	
	public void setCon(DBConnection dbConnection) {
		this.dbConnection = dbConnection;
	}

	
	@Override
	public boolean insertData(UserDetails details) {
		System.out.println("Details "+details);
		Connection con=dbConnection.getConnection();
		try {
			String query ="insert into userDetails (Name,Email,PhoneNumber,DOB,Address,ProfilePic) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1,details.getUserName());
			pstmt.setString(2,details.getUserEmail());
			pstmt.setString(3,details.getUserNumber());
			pstmt.setString(4,details.getUserDOB());
			pstmt.setString(5,details.getUserAddress());
			pstmt.setString(6,details.getUserProfilePic());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
