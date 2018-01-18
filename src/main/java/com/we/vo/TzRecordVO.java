package com.we.vo;

import java.util.Date;

/**
 * Created by 123456 on 2018/1/17.
 */
public class TzRecordVO {

    private Integer tzUid;//投资人id
    private String tzName;//投资人姓名
    private Integer juUid;//借款人id
    private String JuName;//借款人姓名
    private Integer tmoney;//投资金额
    private Integer baid;//借款id
    private String cpname;//产品名称
    private String time;//投资时间

    public Integer getTzUid() {
        return tzUid;
    }

    public void setTzUid(Integer tzUid) {
        this.tzUid = tzUid;
    }

    public String getTzName() {
        return tzName;
    }

    public void setTzName(String tzName) {
        this.tzName = tzName;
    }

    public Integer getJuUid() {
        return juUid;
    }

    public void setJuUid(Integer juUid) {
        this.juUid = juUid;
    }

    public String getJuName() {
        return JuName;
    }

    public void setJuName(String juName) {
        JuName = juName;
    }

    public Integer getTmoney() {
        return tmoney;
    }

    public void setTmoney(Integer tmoney) {
        this.tmoney = tmoney;
    }

    public Integer getBaid() {
        return baid;
    }

    public void setBaid(Integer baid) {
        this.baid = baid;
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "TzRecordVO{" +
                "tzUid=" + tzUid +
                ", tzName='" + tzName + '\'' +
                ", juUid=" + juUid +
                ", JuName='" + JuName + '\'' +
                ", tmoney=" + tmoney +
                ", baid=" + baid +
                ", cpname='" + cpname + '\'' +
                ", time=" + time +
                '}';
    }
}
