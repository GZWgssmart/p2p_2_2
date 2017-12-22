package com.we.bean;

import java.util.Date;

/**
 * 媒体报道
 */
public class Media {

    private Integer mid;    // 主键	int	mid
    private String title;   // 标题	String	title
    private String pic;     // 封面图片	String	pic
    private Date date;      // 时间	date	date
    private String url;     // 地址	String	url
    private String content; // 内容	String	content

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}