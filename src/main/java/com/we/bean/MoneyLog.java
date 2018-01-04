package com.we.bean;

import java.math.BigDecimal;
import java.util.Date;

public class MoneyLog {
    private Integer mid;

    private Integer uid;

    private Integer type;

    private BigDecimal in;

    private BigDecimal out;

    private Date date;

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

    public BigDecimal getIn() {
        return in;
    }

    public void setIn(BigDecimal in) {
        this.in = in;
    }

    public BigDecimal getOut() {
        return out;
    }

    public void setOut(BigDecimal out) {
        this.out = out;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public MoneyLog(Integer uid, Integer type, BigDecimal out, Date date) {
        this.uid = uid;
        this.type = type;
        this.out = out;
        this.date = date;
    }

    public MoneyLog(Integer uid, Integer type, Date date, BigDecimal in) {
        this.uid = uid;
        this.type = type;
        this.date = date;
        this.in = in;
    }
}