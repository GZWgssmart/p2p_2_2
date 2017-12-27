package com.we.vo;

import java.util.Date;

/**
 * Created on 2017/12/27 21:52
 * 用于显示： 用户查看站内信（每个用户的查看状态都不同），
 * @author mh
 */
public class UserLetterVO {

    /**
     * user_letter表的id。用户标记已读、未读时修改的是此表的state字段
     */
    private Integer id;
    
    private Integer state;

    private String title;

    private String content;

    private Date date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
