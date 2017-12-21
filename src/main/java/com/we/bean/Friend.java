package com.we.bean;

public class Friend {
    private Integer fid;

    private String imgpath;

    private String imghref;

    private String imgalert;

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
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

    public String getImgalert() {
        return imgalert;
    }

    public void setImgalert(String imgalert) {
        this.imgalert = imgalert == null ? null : imgalert.trim();
    }
}