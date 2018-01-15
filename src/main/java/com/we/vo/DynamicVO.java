package com.we.vo;

import java.util.Date;

/**
 * Created by ID.LQF on 2018/1/15.
 */
public class DynamicVO {

    private Integer dyid;   //主键	int	dyid
    private String title;   //标题	String	title
    private Date date;       //时间	date	date

    public Integer getDyid() {
        return dyid;
    }

    public void setDyid(Integer dyid) {
        this.dyid = dyid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

}
