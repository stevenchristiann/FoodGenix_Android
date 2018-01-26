package com.android.foodgenix.Model;

/**
 * Created by MyLaptop on 11/2/2017.
 */

public class Like {
    private User user;
    private Post post;

    public Like(User user, Post post) {
        this.user = user;
        this.post = post;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }
}
