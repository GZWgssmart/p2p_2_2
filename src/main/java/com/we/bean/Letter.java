package com.we.bean;

import javax.validation.constraints.NotNull;
import java.util.Date;


public class Letter {
    /**
     * 更新时，id字段不能为空， 用法参考LetterController.update();
     */

    private Integer lid;

    private String title;

    private Date date;

    private Integer state;

    private String content;

    @NotNull(message = "不能为空")
    public Integer getLid() {
        return lid;
    }

    public void setLid(Integer lid) {
        this.lid = lid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}