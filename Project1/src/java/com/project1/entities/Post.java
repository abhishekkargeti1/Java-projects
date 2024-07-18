package com.project1.entities;

import java.sql.Timestamp;

public class Post {
    private int Pid;
    private String Title;
    private String Content;
    private String Code;
    private String Picture;
    private Timestamp Date;
    private int cid;
    private int User_Id;

    public int getUser_Id() {
        return User_Id;
    }

    public void setUser_Id(int User_Id) {
        this.User_Id = User_Id;
    }

    public Post() {
    }

    public Post(int Pid, String Title, String Content, String Code, String Picture, Timestamp Date, int cid,int User_id) {
        this.Pid = Pid;
        this.Title = Title;
        this.Content = Content;
        this.Code = Code;
        this.Picture = Picture;
        this.Date = Date;
        this.cid = cid;
        this.User_Id=User_id;
    }

    public Post(String Title, String Content, String Code, String Picture, Timestamp Date, int cid, int User_id) {
        this.Title = Title;
        this.Content = Content;
        this.Code = Code;
        this.Picture = Picture;
        this.Date = Date;
        this.cid = cid;
        this.User_Id=User_id;
    }

    public int getPid() {
        return Pid;
    }

    public void setPid(int Pid) {
        this.Pid = Pid;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public String getCode() {
        return Code;
    }

    public void setCode(String Code) {
        this.Code = Code;
    }

    public String getPicture() {
        return Picture;
    }

    public void setPicture(String Picture) {
        this.Picture = Picture;
    }

    public Timestamp getDate() {
        return Date;
    }

    public void setDate(Timestamp Date) {
        this.Date = Date;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }
    
    
    
}
