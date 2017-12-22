package com.we.bean;

import java.util.Date;

/**
 * 公司动态
 */
public class Dynamic {

    private Integer dyid;   //主键	int	dyid
    private String title;   //标题	String	title
    private Date date;       //时间	date	date
    private String pic;      //封面图片	String	pic
    private String content; //内容	String	content

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
        this.title = title == null ? null : title.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}