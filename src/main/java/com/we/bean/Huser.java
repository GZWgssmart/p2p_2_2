package com.we.bean;

import java.util.Date;

public class Huser {
    private Integer huid;

    private String rname;

    private String sex;

    private String phone;

    private String huname;

    private String email;

    private Date createTime;

    public Integer getHuid() {
        return huid;
    }

    public void setHuid(Integer huid) {
        this.huid = huid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getHuname() {
        return huname;
    }

    public void setHuname(String huname) {
        this.huname = huname == null ? null : huname.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}