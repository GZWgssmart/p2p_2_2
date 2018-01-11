package com.we.vo;

import java.math.BigDecimal;

/**
 * Created by 123456 on 2018/1/11.
 */
public class NowDateVO {

    private BigDecimal allMoney;//撮合交易总额

    private Integer dealNumber;//交易笔数

    private BigDecimal repayAmount;//已还本金

    private BigDecimal unRepayAmount;//待还本金

    private Integer unRepayNumber;//待还笔数

    private BigDecimal hasInterest;//为用户创造的收益

    private BigDecimal overdueMoney;//逾期金额

    private Integer overdueNumber;//逾期笔数

    public BigDecimal getAllMoney() {
        return allMoney;
    }

    public void setAllMoney(BigDecimal allMoney) {
        this.allMoney = allMoney;
    }

    public Integer getDealNumber() {
        return dealNumber;
    }

    public void setDealNumber(Integer dealNumber) {
        this.dealNumber = dealNumber;
    }

    public BigDecimal getRepayAmount() {
        return repayAmount;
    }

    public void setRepayAmount(BigDecimal repayAmount) {
        this.repayAmount = repayAmount;
    }

    public BigDecimal getUnRepayAmount() {
        return unRepayAmount;
    }

    public void setUnRepayAmount(BigDecimal unRepayAmount) {
        this.unRepayAmount = unRepayAmount;
    }

    public Integer getUnRepayNumber() {
        return unRepayNumber;
    }

    public void setUnRepayNumber(Integer unRepayNumber) {
        this.unRepayNumber = unRepayNumber;
    }

    public BigDecimal getHasInterest() {
        return hasInterest;
    }

    public void setHasInterest(BigDecimal hasInterest) {
        this.hasInterest = hasInterest;
    }

    public BigDecimal getOverdueMoney() {
        return overdueMoney;
    }

    public void setOverdueMoney(BigDecimal overdueMoney) {
        this.overdueMoney = overdueMoney;
    }

    public Integer getOverdueNumber() {
        return overdueNumber;
    }

    public void setOverdueNumber(Integer overdueNumber) {
        this.overdueNumber = overdueNumber;
    }

    @Override
    public String toString() {
        return "NowDateVO{" +
                "allMoney=" + allMoney +
                ", dealNumber=" + dealNumber +
                ", repayAmount=" + repayAmount +
                ", unRepayAmount=" + unRepayAmount +
                ", unRepayNumber=" + unRepayNumber +
                ", hasInterest=" + hasInterest +
                ", overdueMoney=" + overdueMoney +
                ", overdueNumber=" + overdueNumber +
                '}';
    }
}
