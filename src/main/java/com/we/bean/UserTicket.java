package com.we.bean;

import java.util.Date;

public class UserTicket {
    private Integer rwid;

    private Integer uid;

    private Integer kid;

    private Date tktime;

    private Integer state;

    public Integer getRwid() {
        return rwid;
    }

    public void setRwid(Integer rwid) {
        this.rwid = rwid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getKid() {
        return kid;
    }

    public void setKid(Integer kid) {
        this.kid = kid;
    }

    public Date getTktime() {
        return tktime;
    }

    public void setTktime(Date tktime) {
        this.tktime = tktime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}