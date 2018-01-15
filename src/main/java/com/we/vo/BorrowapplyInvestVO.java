package com.we.vo;

import java.math.BigDecimal;

/**
 * Created by 123456 on 2018/1/12.
 */
public class BorrowapplyInvestVO {

    private Integer baid;//借款id

    private String cpname;//产品名称

    private BigDecimal money;

    private Integer nprofit; //年化收益

    private Integer term; //借款期限  --项目期限

    private String bzname;//还款方式

    private String lxname; //借款类型

    private Integer state;

    private BigDecimal nowmoney;//已投金额

    private BigDecimal elseMoney; //可投金额

    private BigDecimal jindu;

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

    public Integer getNprofit() {
        return nprofit;
    }

    public void setNprofit(Integer nprofit) {
        this.nprofit = nprofit;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
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

    public BigDecimal getNowmoney() {
        return nowmoney;
    }

    public void setNowmoney(BigDecimal nowmoney) {
        this.nowmoney = nowmoney;
    }

    public BigDecimal getJindu() {
        return jindu;
    }

    public void setJindu(BigDecimal jindu) {
        this.jindu = jindu;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public BigDecimal getElseMoney() {
        return elseMoney;
    }

    public void setElseMoney(BigDecimal elseMoney) {
        this.elseMoney = elseMoney;
    }

    @Override
    public String toString() {
        return "BorrowapplyInvestVO{" +
                "baid=" + baid +
                ", cpname='" + cpname + '\'' +
                ", nprofit=" + nprofit +
                ", term=" + term +
                ", bzname='" + bzname + '\'' +
                ", state=" + state +
                ", jindu=" + jindu +
                ", lxname=" + lxname +
                ", nowmoney=" + nowmoney +
                ", money=" + money +
                '}';
    }
}
