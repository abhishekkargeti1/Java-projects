package com.project1.dao;

import com.project1.entities.Categories;
import com.project1.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Categories> getCategories() {
        ArrayList<Categories> list = new ArrayList<>();
        try {
            String query = "select * from Categories";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {
                int cid = set.getInt("Cid");
                String Name = set.getString("Name");
                String Description = set.getString("Description");
                Categories categories = new Categories(cid, Name, Description);
                list.add(categories);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean savePost(Post post) {
        boolean status = false;
        try {
            String query = "insert into post_details(Title, Content,Code,Picture,Cid,User_Id) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, post.getTitle());
            pstmt.setString(2, post.getContent());
            pstmt.setString(3, post.getCode());
            pstmt.setString(4, post.getPicture());
            pstmt.setInt(5, post.getCid());
            pstmt.setInt(6, post.getUser_Id());
            pstmt.executeUpdate();
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public List<Post> getallPost() {
        List<Post> list = new ArrayList<>();
        try {
            String query = "select * from post_details order by Pid desc";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {

                int Pid = set.getInt("Pid");
                String Title = set.getString("Title");
//                System.out.println(Title);
                String Content = set.getString("Content");
                String Code = set.getString("Code");
                String Picture = set.getString("Picture");
                Timestamp Date = set.getTimestamp("Date");
                int Cid = set.getInt("Cid");
                int User_id = set.getInt("User_id");
                Post post = new Post(Pid, Title, Content, Code, Picture, Date, Cid, User_id);
                list.add(post);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getPostByCId(int Cid) {
        List<Post> list = new ArrayList<>();
        try {
            String query = "select * from post_details where Cid=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, Cid);
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {

                int Pid = set.getInt("Pid");
                String Title = set.getString("Title");
                String Content = set.getString("Content");
                String Code = set.getString("Code");
                String Picture = set.getString("Picture");
                Timestamp Date = set.getTimestamp("Date");
                int User_id = set.getInt("User_id");
                Post post = new Post(Pid, Title, Content, Code, Picture, Date, Cid, User_id);
                list.add(post);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Post getPostByPostId(int postId) {
        Post post = null;
        String query = "select * from post_details where Pid=?";
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, postId);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                post = new Post();
                int Pid = set.getInt("Pid");
                String Title = set.getString("Title");
                String Content = set.getString("Content");
                String Code = set.getString("Code");
                String Picture = set.getString("Picture");
                Timestamp Date = set.getTimestamp("Date");
                int User_id = set.getInt("User_id");
                int Cid = set.getInt("Cid");
                post = new Post(Pid, Title, Content, Code, Picture, Date, Cid, User_id);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
}
