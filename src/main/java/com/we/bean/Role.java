package com.we.bean;

public class Role {
    private Integer jid;

    private String rname;

    private String content;

    public Integer getJid() {
        return jid;
    }

    public void setJid(Integer jid) {
        this.jid = jid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    @Override
    public String toString() {
        return "Role{" +
                "jid=" + jid +
                ", rname='" + rname + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}