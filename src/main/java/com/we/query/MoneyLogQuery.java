package com.we.query;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 资金流向
 * Created by ID.LQF on 2018/1/5.
 */
public class MoneyLogQuery {

    private Integer mid;    // 主键	int	mid
    private Integer uid;    // 用户id	int	uid
    private Date date;      // 时间	date	date
    private Date startTime; // 查询开始的时间
    private Date endTime;   // 查询结束的时间

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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }


}
