package com.project1.entities;

import java.sql.*;

public class User {

    private int id;
    private String name;
    private String email;
    private String password;
    private String PhoneNumber;
    private String gender;
    private String User_Profile;
    private Timestamp DateTime;
    private String Profile;

    public User(int id, String name, String email, String password, String PhoneNumber, String gender, Timestamp DateTime, String User_Profile) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.PhoneNumber = PhoneNumber;
        this.gender = gender;
        this.DateTime = DateTime;

    }

    public User() {

    }

    public User(String name, String email, String password, String PhoneNumber, String gender, String Profile) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.PhoneNumber = PhoneNumber;
        this.gender = gender;
        this.Profile = Profile;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getUser_Profile() {
        return User_Profile;
    }

    public void setUser_Profile(String User_Profile) {
        this.User_Profile = User_Profile;
    }

    public String getProfile() {
        return Profile;
    }

    public void setProfile(String Profile) {
        this.Profile = Profile;
    }

    public Timestamp getDateTime() {
        return DateTime;
    }

    public void setDateTime(Timestamp DateTime) {
        this.DateTime = DateTime;
    }

}
