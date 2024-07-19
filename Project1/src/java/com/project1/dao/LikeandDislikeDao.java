package com.project1.dao;

import java.sql.*;

public class LikeandDislikeDao {

    Connection con;

    public LikeandDislikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int Post_id, int User_id) {
        boolean status = false;
        try {
            String query = "insert into Like_details(Post_id,User_id)value (?,?) ";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, Post_id);
            pstmt.setInt(2, User_id);
            pstmt.executeUpdate();
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public int countLikeOnPost(int Post_id) {
        int count = 0;
        try {
            String query = "select count(*) from Like_details where Post_id=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, Post_id);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                count = set.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean isLikedByUser(int Post_id, int User_id) {
        boolean status = false;
        try {
            String query = "select * from Like_details where Post_id =? and User_id=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, Post_id);
            pstmt.setInt(2, User_id);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                status = true;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    public boolean isDislikedByUser(int Post_id,int User_id){
        boolean status = false;
        try{
            String query ="delete * from Like_details where Post_id=? and User_id=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, Post_id);
            pstmt.setInt(2, User_id);
            pstmt.executeUpdate();
            status=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }
}
