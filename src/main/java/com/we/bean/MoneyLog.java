package com.we.bean;

import java.math.BigDecimal;
import java.util.Date;

public class MoneyLog {
    private Integer mid;

    private Integer uid;

    private Integer type;

    private BigDecimal inMoney;

    private BigDecimal outMoney;

    private Date date;

    public MoneyLog(Integer uid, Integer type, BigDecimal outMoney, Date date) {
        this.uid = uid;
        this.type = type;
        this.outMoney = outMoney;
        this.date = date;
    }

    public MoneyLog(Integer uid, Integer type, Date date, BigDecimal inMoney) {
        this.uid = uid;
        this.type = type;
        this.date = date;
        this.inMoney = inMoney;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public BigDecimal getInMoney() {
        return inMoney;
    }

    public void setInMoney(BigDecimal inMoney) {
        this.inMoney = inMoney;
    }

    public BigDecimal getOutMoney() {
        return outMoney;
    }

    public void setOutMoney(BigDecimal outMoney) {
        this.outMoney = outMoney;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}