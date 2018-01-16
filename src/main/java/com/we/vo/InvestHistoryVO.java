package com.we.vo;

import java.math.BigDecimal;
import java.util.Date;

public class InvestHistoryVO {

    private String phone;
    private BigDecimal money;
    private Date time;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
