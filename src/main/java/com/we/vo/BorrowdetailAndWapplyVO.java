package com.we.vo;

import java.math.BigDecimal;
import java.text.DecimalFormat;

/**
 * 借款详情所需查询的vo对象
 * Created by ID.LQF on 2018/1/11.
 */
public class BorrowdetailAndWapplyVO {

    private Integer bdid;       // 主键  bd表的
    private Integer baid;     // 借款id  ba表的
    private BigDecimal money;   // 借款金额   ba表的
    private BigDecimal symoney;   // 已借金额   ba表的
    private String jdmoney;   // 借款进度
    private BigDecimal nprofit;   // 年化利率   bd表的
    private String cpname;    // 产品号         bd表的
    private Integer type;    // 借款类型   ba表的
    private Integer state;   // 审核状态   ba表的
    private Integer term;    // 借款期限   ba表的

    public Integer getBdid() {
        return bdid;
    }

    public void setBdid(Integer bdid) {
        this.bdid = bdid;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public BigDecimal getNprofit() {
        return nprofit;
    }

    public void setNprofit(BigDecimal nprofit) {
        this.nprofit = nprofit;
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname;
    }

    public Integer getBaid() {
        return baid;
    }

    public void setBaid(Integer baid) {
        this.baid = baid;
    }

    public BigDecimal getSymoney() {
        return symoney;
    }

    public void setSymoney(BigDecimal symoney) {
        this.symoney = symoney;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
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

    public String getJdmoney() {
        DecimalFormat df = new DecimalFormat("0.00%");
        return df.format((money.subtract(symoney)).divide(money));
    }

}
