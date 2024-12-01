package com.helperclasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Validation {

	static Connection con = DBConnection.getConnection();

	public static boolean emailValidation(String email) {

		boolean isValid = false;
		try {
			String query = "Select count(*)from userDetails where Email=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			ResultSet rs  = pstmt.executeQuery();
			if(rs.next()) {
				int count = rs.getInt(1);
				if(count>0) {
					isValid = true ;
					return isValid;					
				}else {
					return isValid;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return isValid;
	}
}
