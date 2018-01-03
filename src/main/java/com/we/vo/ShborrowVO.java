package com.we.vo;

import java.math.BigDecimal;
import java.util.Date;

public class ShborrowVO {
    private Integer shid;

    private Integer baid;

    private String rname;

    private String huname;

    private String bzname;

    private String lxname;

    private String excuse;

    private BigDecimal money;

    private Integer state;

    private Integer term;

    private Date deadline;

    private Date applyTime;

    private Date checkTime;

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Date getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
    }

    public Date getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime = checkTime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public String getBzname() {
        return bzname;
    }

    public void setBzname(String bzname) {
        this.bzname = bzname;
    }

    public String getLxname() {
        return lxname;
    }

    public void setLxname(String lxname) {
        this.lxname = lxname;
    }

    public String getExcuse() {
        return excuse;
    }

    public void setExcuse(String excuse) {
        this.excuse = excuse;
    }

    public Integer getShid() {
        return shid;
    }

    public void setShid(Integer shid) {
        this.shid = shid;
    }

    public String getHuname() {
        return huname;
    }

    public void setHuname(String huname) {
        this.huname = huname;
    }

    public Integer getBaid() {
        return baid;
    }

    public void setBaid(Integer baid) {
        this.baid = baid;
    }
}