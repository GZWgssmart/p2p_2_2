package com.we.query;

import org.springframework.format.annotation.DateTimeFormat;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 推荐管理
 * Created by ID.LQF on 2018/1/5.
 */
public class RecommendQuery {

    private Integer rid;    // 主键	int	id
    private Integer tid;    // 推荐人id	int	tid
    private String tname;   // 推荐人姓名	String	tname
    private Integer uid;    // 被推荐人id	int	uid
    private String rname;   // 被推荐人姓名	String	rname
    private Date date;      // 时间	date	date
    private Date startTime; // 查询开始的时间
    private Date endTime;   // 查询结束的时间

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
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

    public String getStrStart() {
        return new SimpleDateFormat("yyyy-MM-dd").format(getStartTime());
    }

    public String getStrEnd() {
        return new SimpleDateFormat("yyyy-MM-dd").format(getEndTime());
    }

}
