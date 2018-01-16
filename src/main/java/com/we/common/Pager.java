package com.we.common;

import java.util.List;

/**
 * Created on 2017/11/23 16:02
 *
 * @author mh
 */
public class Pager {

    /**
     * 偏移量（开始索引）
     */
    private Long offset;

    /**
     * 每页显示的条目个数（查询多少个）
     */
    private Long limit;

    /**
     * 总结果数
     */
    private Long total;

    /**
     * 查询的结果集
     */
    private List<Object> rows;

    public Pager() {
    }

    /**
     * 方便快速构建对象
     * @param offset 偏移数
     * @param limit 每页条目数
     */
    public Pager(Long offset, Long limit) {
        if (offset == null) {
            offset = 0L;
        }
        if (limit == null) {
            limit = 10L;
        }
        this.offset = offset;
        this.limit = limit;
    }

    public Long getPages() {
        return null;
    }

    public Long getOffset() {
        return offset;
    }

    public void setOffset(Long offset) {
        this.offset = offset;
    }

    public Long getLimit() {
        return limit;
    }

    public void setLimit(Long limit) {
        this.limit = limit;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public List<Object> getRows() {
        return rows;
    }

    public void setRows(List<Object> rows) {
        this.rows = rows;
    }
}