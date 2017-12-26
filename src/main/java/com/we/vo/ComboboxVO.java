package com.we.vo;

/**
 * Created on 2017/12/26 14:20
 *
 * @author mh
 */
public class ComboboxVO {

    private String text;
    private Long id;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "ComboboxVO{" +
                "text='" + text + '\'' +
                ", id=" + id +
                '}';
    }
}
