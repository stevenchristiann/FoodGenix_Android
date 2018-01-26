package com.android.foodgenix.Model;

/**
 * Created by MyLaptop on 11/2/2017.
 */

public class Voucher {
    private String imgUrl;
    private long price;
    private String desc;

    public Voucher(String imgUrl, long price, String desc) {
        this.imgUrl = imgUrl;
        this.price = price;
        this.desc = desc;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
