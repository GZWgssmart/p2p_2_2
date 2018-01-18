package com.we.vo;

import java.math.BigDecimal;

public class ClaculateEarnVO {

    private BigDecimal money;
    private Integer bzid;
    private BigDecimal nprofit;
    private Integer term;

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Integer getBzid() {
        return bzid;
    }

    public void setBzid(Integer bzid) {
        this.bzid = bzid;
    }

    public BigDecimal getNprofit() {
        return nprofit;
    }

    public void setNprofit(BigDecimal nprofit) {
        this.nprofit = nprofit;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }
}
