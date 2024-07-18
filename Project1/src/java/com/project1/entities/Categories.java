package com.project1.entities;
public class Categories {
    private int cid;
    private String Name;
    private String description;

    public Categories(int cid, String Name, String description) {
        this.cid = cid;
        this.Name = Name;
        this.description = description;
    }

    public Categories() {
    }

    public Categories(String Name, String description) {
        this.Name = Name;
        this.description = description;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
