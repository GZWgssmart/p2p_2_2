package com.we.dto;

import java.math.BigDecimal;

/**
 * Created on 2018/1/19 20:39
 *
 * @author mh
 */
public class TxAndCz {

    private Integer uid;

    private Integer bcid;

    private String zpwd;

    private BigDecimal money;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getBcid() {
        return bcid;
    }

    public void setBcid(Integer bcid) {
        this.bcid = bcid;
    }

    public String getZpwd() {
        return zpwd;
    }

    public void setZpwd(String zpwd) {
        this.zpwd = zpwd;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }
}
