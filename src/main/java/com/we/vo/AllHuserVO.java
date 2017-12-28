package com.we.vo;

/**
 * Created by 123456 on 2017/12/27.
 */
public class AllHuserVO {

    private Integer hid;

    private String rname;

    private String sex;

    private String email;

    private String roleRname;//角色名

    public Integer getHid() {
        return hid;
    }

    public void setHid(Integer hid) {
        this.hid = hid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRoleRname() {
        return roleRname;
    }

    public void setRoleRname(String roleRname) {
        this.roleRname = roleRname;
    }

    @Override
    public String toString() {
        return "AllHuserVO{" +
                "hid=" + hid +
                ", rname='" + rname + '\'' +
                ", sex='" + sex + '\'' +
                ", email='" + email + '\'' +
                ", roleRname='" + roleRname + '\'' +
                '}';
    }
}
