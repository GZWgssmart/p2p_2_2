package com.we.bean;

import java.util.Date;

/**
 * 推荐管理
 */
public class Recommend {

    private Integer rid;    // 主键	int	id
    private Integer tid;    // 推荐人id	int	tid
    private String tname;   // 推荐人姓名	String	tname
    private Integer uid;    // 被推荐人id	int	uid
    private String rname;   // 被推荐人姓名	String	rname
    private Date date;      // 时间	date	date

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
        this.tname = tname == null ? null : tname.trim();
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
        this.rname = rname == null ? null : rname.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}