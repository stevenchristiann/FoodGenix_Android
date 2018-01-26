package com.android.foodgenix.Model;

/**
 * Created by MyLaptop on 11/2/2017.
 */

public class User {
    private String id;
    private String username;
    private String name;
    private String email;
    private String phone_number;
    private String gender;
    private String birthdate;
    private String facebook_id;
    private String google_id;
    private String post_count;
    private String follower_count;
    private String following_count;
    private String photo_url;
    private String bio;
    private String foodgenix_points;
    private String is_restaurant;
    private String setting_id;
    private String created_at;
    private String modified_at;
    private String deleted_at;

    public User(String id, String username, String name, String post_count, String follower_count, String following_count, String photo_url, String bio, String foodgenix_points, String is_restaurant) {
        this.id = id;
        this.username = username;
        this.name = name;
        this.post_count = post_count;
        this.follower_count = follower_count;
        this.following_count = following_count;
        this.photo_url = photo_url;
        this.bio = bio;
        this.foodgenix_points = foodgenix_points;
        this.is_restaurant = is_restaurant;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public String getFacebook_id() {
        return facebook_id;
    }

    public void setFacebook_id(String facebook_id) {
        this.facebook_id = facebook_id;
    }

    public String getGoogle_id() {
        return google_id;
    }

    public void setGoogle_id(String google_id) {
        this.google_id = google_id;
    }

    public String getPost_count() {
        return post_count;
    }

    public void setPost_count(String post_count) {
        this.post_count = post_count;
    }

    public String getFollower_count() {
        return follower_count;
    }

    public void setFollower_count(String follower_count) {
        this.follower_count = follower_count;
    }

    public String getFollowing_count() {
        return following_count;
    }

    public void setFollowing_count(String following_count) {
        this.following_count = following_count;
    }

    public String getPhoto_url() {
        return photo_url;
    }

    public void setPhoto_url(String photo_url) {
        this.photo_url = photo_url;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getFoodgenix_points() {
        return foodgenix_points;
    }

    public void setFoodgenix_points(String foodgenix_points) {
        this.foodgenix_points = foodgenix_points;
    }

    public String getIs_restaurant() {
        return is_restaurant;
    }

    public void setIs_restaurant(String is_restaurant) {
        this.is_restaurant = is_restaurant;
    }

    public String getSetting_id() {
        return setting_id;
    }

    public void setSetting_id(String setting_id) {
        this.setting_id = setting_id;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getModified_at() {
        return modified_at;
    }

    public void setModified_at(String modified_at) {
        this.modified_at = modified_at;
    }

    public String getDeleted_at() {
        return deleted_at;
    }

    public void setDeleted_at(String deleted_at) {
        this.deleted_at = deleted_at;
    }
}
