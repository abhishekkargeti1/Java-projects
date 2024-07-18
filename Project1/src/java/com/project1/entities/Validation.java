/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project1.entities;

import java.sql.*;

public class Validation {

    private Connection con;
    
   public  Validation(){
    
    }
    
    public Validation(Connection con){
        this.con = con;
    }

    
    public boolean User_PasswordChecker(String Password) {
        boolean passwordValidation = false;
        if (Password != null && !Password.trim().isEmpty()) {
            passwordValidation = true;
            return passwordValidation;
        }
        return passwordValidation;

    }
    
    public boolean User_EmailChecker1(String Email){
        boolean emailValidation = false;
        if(Email  != null && !Email.trim().isEmpty()){
            emailValidation = true;
            return emailValidation;
        }
       return emailValidation;
    }

    public boolean User_NameChecker(String Name) {
//        System.out.println(Name);
        boolean nameValidation = false;
        if (Name != null && !Name.trim().isEmpty()) {
            nameValidation = true;
            return nameValidation;
        }
        return nameValidation;
    }

    public boolean User_phonenumberChecker(String PhoneNumber) {
        boolean phoneNumberValidation = false;
        if (PhoneNumber.length() == 10) {
            phoneNumberValidation = true;
            return phoneNumberValidation;
        } else {
            return phoneNumberValidation;
        }

    }

    public boolean User_Emailchecker(String Email) {
        try {
            boolean emailVerified = false;
            String query = "select count(*) from user_details where email=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, Email);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                int count = set.getInt(1);
                if (count > 0) {
                    System.out.println("Email Exist in Database");
                    return emailVerified;
                } else {
                    System.out.println("Email Not Exist in Database");
                    emailVerified = true;
                    return emailVerified;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
