package com.android.foodgenix.Model;

import java.util.ArrayList;

public class Post {
    private User userPosted;
    private ArrayList<Comment> comments;
    private String location;
    private String img;
    private String caption;
    private int totalLike;

    public Post(User userPosted, ArrayList<Comment> comments, String location, String img, int totalLike,String caption) {
        this.userPosted = userPosted;
        this.comments = comments;
        this.location = location;
        this.img = img;
        this.totalLike = totalLike;
        this.caption = caption;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public User getUserPosted() {
        return userPosted;
    }

    public void setUserPosted(User userPosted) {
        this.userPosted = userPosted;
    }

    public ArrayList<Comment> getComments() {
        return comments;
    }

    public void setComments(ArrayList<Comment> comments) {
        this.comments = comments;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getTotalLike() {
        return totalLike;
    }

    public void setTotalLike(int totalLike) {
        this.totalLike = totalLike;
    }
}