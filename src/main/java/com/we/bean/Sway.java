package com.we.bean;

public class Sway {
    private Integer sid;

    private String way;

    private String fw;

    private Integer state;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way == null ? null : way.trim();
    }

    public String getFw() {
        return fw;
    }

    public void setFw(String fw) {
        this.fw = fw == null ? null : fw.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}