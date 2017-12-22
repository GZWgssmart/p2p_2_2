package com.we.bean;

/**
 * 首页信息
 */
public class HomeImg {

    private Integer hid;     // 主键
    private String imgpath;  // 图片地址
    private String imghref;  // 图片对应的连接

    public Integer getHid() {
        return hid;
    }

    public void setHid(Integer hid) {
        this.hid = hid;
    }

    public String getImgpath() {
        return imgpath;
    }

    public void setImgpath(String imgpath) {
        this.imgpath = imgpath == null ? null : imgpath.trim();
    }

    public String getImghref() {
        return imghref;
    }

    public void setImghref(String imghref) {
        this.imghref = imghref == null ? null : imghref.trim();
    }
}