package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.beans.factory.annotation.Autowired;

import com.entities.UserDetails;
import com.helperclasses.DBConnection;

public class DaoLayerImpl implements Daolayer {

	private Connection con = DBConnection.getConnection();
	@Autowired
	private UserDetails details;
		
	@Override
	public boolean insertData(UserDetails details) {
		System.out.println("Details "+details);
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

	@Override
	public UserDetails getUserDetails(String email, String password) {
		try {
			
			UserDetails details = null;
			String query = "select * from userDetails where email=? and password=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet rs =pstmt.executeQuery();
			
			while(rs.next()) {
				details = new UserDetails(); 
				details.setId(rs.getInt("Id"));
				details.setUserName(rs.getString("Name"));
				details.setUserEmail(rs.getString("Email"));
				details.setUserNumber(rs.getString("PhoneNumber"));
				details.setUserDOB(rs.getString("DOB"));
				details.setUserAddress(rs.getString("Address"));
				details.setUserProfilePic(rs.getString("ProfilePic"));
				details.setUserPassword(rs.getString("Password"));
			}
			// System.out.println("Details of dao"+details);
			return details;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return details;
	}
	
}
