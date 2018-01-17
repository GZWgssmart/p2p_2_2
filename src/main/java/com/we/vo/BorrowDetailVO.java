package com.we.vo;

import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

public class BorrowDetailVO {

    private Integer baid;

    private String rname;

    private BigDecimal money;

    private Integer uid;

    private Integer bzid;

    private Date time;

    private Integer state;

    private Integer type;

    private Integer term;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date deadline;

    private BigDecimal symoney;

    private String fpic;

    private String ypic;

    private String qpic;

    private String tpic;

    private String mpurpose;

    private String hksource;

    private String suggest;

    private String guarantee;

    private BigDecimal nprofit;

    private String way;

    private String cpname;

    private String xmdescrip;

    private String bidType;

    private Integer bidCount;

    private BigDecimal schedule;

    public Integer getBaid() {
        return baid;
    }

    public void setBaid(Integer baid) {
        this.baid = baid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getBzid() {
        return bzid;
    }

    public void setBzid(Integer bzid) {
        this.bzid = bzid;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
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

    public BigDecimal getSymoney() {
        return symoney;
    }

    public void setSymoney(BigDecimal symoney) {
        this.symoney = symoney;
    }

    public String getFpic() {
        return fpic;
    }

    public void setFpic(String fpic) {
        this.fpic = fpic;
    }

    public String getYpic() {
        return ypic;
    }

    public void setYpic(String ypic) {
        this.ypic = ypic;
    }

    public String getQpic() {
        return qpic;
    }

    public void setQpic(String qpic) {
        this.qpic = qpic;
    }

    public String getTpic() {
        return tpic;
    }

    public void setTpic(String tpic) {
        this.tpic = tpic;
    }

    public String getMpurpose() {
        return mpurpose;
    }

    public void setMpurpose(String mpurpose) {
        this.mpurpose = mpurpose;
    }

    public String getHksource() {
        return hksource;
    }

    public void setHksource(String hksource) {
        this.hksource = hksource;
    }

    public String getSuggest() {
        return suggest;
    }

    public void setSuggest(String suggest) {
        this.suggest = suggest;
    }

    public String getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(String guarantee) {
        this.guarantee = guarantee;
    }

    public BigDecimal getNprofit() {
        return nprofit;
    }

    public void setNprofit(BigDecimal nprofit) {
        this.nprofit = nprofit;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname;
    }

    public String getXmdescrip() {
        return xmdescrip;
    }

    public void setXmdescrip(String xmdescrip) {
        this.xmdescrip = xmdescrip;
    }

    public String getBidType() {
        return bidType;
    }

    public void setBidType(String bidType) {
        this.bidType = bidType;
    }

    public Integer getBidCount() {
        return bidCount;
    }

    public void setBidCount(Integer bidCount) {
        this.bidCount = bidCount;
    }

    public BigDecimal getSchedule() {
        return schedule;
    }

    public void setSchedule(BigDecimal schedule) {
        this.schedule = schedule;
    }

    @Override
    public String toString() {
        return "BorrowDetailVO{" +
                "baid=" + baid +
                ", rname='" + rname + '\'' +
                ", money=" + money +
                ", uid=" + uid +
                ", bzid=" + bzid +
                ", time=" + time +
                ", state=" + state +
                ", type=" + type +
                ", term=" + term +
                ", deadline=" + deadline +
                ", symoney=" + symoney +
                ", fpic='" + fpic + '\'' +
                ", ypic='" + ypic + '\'' +
                ", qpic='" + qpic + '\'' +
                ", tpic='" + tpic + '\'' +
                ", mpurpose='" + mpurpose + '\'' +
                ", hksource='" + hksource + '\'' +
                ", suggest='" + suggest + '\'' +
                ", guarantee='" + guarantee + '\'' +
                ", nprofit=" + nprofit +
                ", way='" + way + '\'' +
                ", cpname='" + cpname + '\'' +
                ", xmdescrip='" + xmdescrip + '\'' +
                ", bidType='" + bidType + '\'' +
                ", bidCount=" + bidCount +
                ", schedule=" + schedule +
                '}';
    }
}
