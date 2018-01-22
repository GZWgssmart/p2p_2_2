package com.we.bean;

public class Rzvip {
    private Integer rid;

    private Integer uid;

    private String xl;

    private String ism;

    private String bschool;

    private String addr;

    private String work;

    private Integer age;

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getXl() {
        return xl;
    }

    public void setXl(String xl) {
        this.xl = xl == null ? null : xl.trim();
    }

    public String getIsm() {
        return ism;
    }

    public void setIsm(String ism) {
        this.ism = ism == null ? null : ism.trim();
    }

    public String getBschool() {
        return bschool;
    }

    public void setBschool(String bschool) {
        this.bschool = bschool == null ? null : bschool.trim();
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr == null ? null : addr.trim();
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work == null ? null : work.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "Rzvip{" +
                "rid=" + rid +
                ", uid=" + uid +
                ", xl='" + xl + '\'' +
                ", ism='" + ism + '\'' +
                ", bschool='" + bschool + '\'' +
                ", addr='" + addr + '\'' +
                ", work='" + work + '\'' +
                ", age=" + age +
                '}';
    }
}