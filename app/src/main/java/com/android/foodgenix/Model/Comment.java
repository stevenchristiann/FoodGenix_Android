package com.android.foodgenix.Model;

import java.util.Date;

/**
 * Created by MyLaptop on 11/2/2017.
 */

public class Comment {
    private User user;
    private String txtComment;
    private Date postedDate;

    public Comment(User user, String txtComment, Date postedDate) {
        this.user = user;
        this.txtComment = txtComment;
        this.postedDate = postedDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTxtComment() {
        return txtComment;
    }

    public void setTxtComment(String txtComment) {
        this.txtComment = txtComment;
    }

    public Date getPostedDate() {
        return postedDate;
    }

    public void setPostedDate(Date postedDate) {
        this.postedDate = postedDate;
    }
}
