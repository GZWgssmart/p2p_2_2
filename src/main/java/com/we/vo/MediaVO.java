package com.we.vo;

/**
 * Created by ID.LQF on 2018/1/15.
 */
public class MediaVO {

    private Integer mid;    // 主键	int	mid
    private String title;   // 标题	String	title
    private String pic;     // 封面图片	String	pic
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
        this.title = title;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
