package com.we.bean;

import javax.validation.constraints.NotNull;

public class Friend {
    private Integer fid;

    private String imgpath;

    private String imghref;

    private String imgalert;


    /**
     * 更新时，id字段不能为空， 用法参考LetterController.update();
     */
    @NotNull(message = "不能为空")
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