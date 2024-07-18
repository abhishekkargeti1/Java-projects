package com.project1.dao;

import com.project1.entities.User;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class UserDao {

    private Connection con;
    private HttpSession session;

    public UserDao(Connection con) {
        this.con = con;
    }

    public UserDao(Connection con, HttpSession session) {
        this.con = con;
        this.session = session;
    }

    // To insert user into database 
    public boolean saveUser(User user) {
        boolean valueStored = false;
        try {
            String query = "insert into user_details(name,email,password,phonenumber,gender,Profile) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getPhoneNumber());
            pstmt.setString(5, user.getGender());
            pstmt.setString(6, user.getProfile());
            pstmt.executeUpdate();
            valueStored = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return valueStored;
    }

    // get User from Database
    public User getUserbyEmailAndPassword(String email, String password) {
        User user = null;
        try {

            System.out.println("==>" + email + "<==");
            System.out.println("==>" + password + "<==");
            String query = "select * from user_details where email=? and password=? ";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                user = new User();

//               getting  data from db  and setting  data to user object
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setPhoneNumber(set.getString("phonenumber"));
                user.setGender(set.getString("gender"));
                user.setDateTime(set.getTimestamp("date"));
                user.setProfile(set.getString("Profile"));
                user.setUser_Profile(set.getString("User_Profile"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean UpdateUserDetails(User user) {
        boolean valueStored = false;
        try {
            System.out.println("Entering UpdateUserDetails in UserDao class with input name : " + user.getName() + ", Phonenumber: " + user.getPhoneNumber() + ",user_profile: " + user.getUser_Profile() + ",id:" + user.getId());
//            String query="update user_details set name=?, phonenumber=?, User_profile=? where id=?";
            String query = "update user_details set ";
            int inputCount = 0;
            if (user.getName() != null || !user.getName().isEmpty()) {
                query = query + "name='" + user.getName() + "'";
                inputCount++;
            }
            if (user.getPhoneNumber() != null || !user.getPhoneNumber().isEmpty()) {
                if (inputCount > 0) {
                    query = query + ",";
                }
                query = query + "phonenumber='" + user.getPhoneNumber() + "'";
                inputCount++;
            }
            if (user.getUser_Profile() != null && !user.getUser_Profile().isEmpty()) {
                if (inputCount > 0) {
                    query = query + ",";
                }
                query = query + "User_profile='" + user.getUser_Profile() + "'";
                inputCount++;
            }

            query = query + "where id='" + user.getId() + "'";
            System.out.println(query);
            PreparedStatement pstmt = con.prepareStatement(query);
//            pstmt.setString(1, user.getName());
//            pstmt.setString(2, user.getPhoneNumber());
//            pstmt.setString(3, user.getUser_Profile());
//            pstmt.setInt(4, user.getId());
            System.out.println(query);
            pstmt.executeUpdate();

            valueStored = true;

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }
        System.out.println("Exiting UpdateUserDetails in UserDao class with output: " + valueStored);
        return valueStored;
    }

    public User getUserByUserId(int userId) {
        User user = null;
        try {
            String query = "select * from user_details where id=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userId);
            ResultSet set=pstmt.executeQuery();
            if(set.next()){
                  user = new User();

//               getting  data from db  and setting  data to user object
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setPhoneNumber(set.getString("phonenumber"));
                user.setGender(set.getString("gender"));
                user.setDateTime(set.getTimestamp("date"));
                user.setProfile(set.getString("Profile"));
                user.setUser_Profile(set.getString("User_Profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

}
