package com.we.vo;

public class RoleSerachVO {

    private String rname;

    private String content;

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "RoleSerachVO{" +
                "rname='" + rname + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
