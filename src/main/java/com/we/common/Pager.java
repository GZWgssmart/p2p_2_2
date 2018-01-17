package com.we.common;

import java.util.List;

/**
 * Created on 2017/11/23 16:02
 *
 * @author mh
 */
public class Pager {
    /**
     * 用于前台页面分页
     * 当前页数
     */
    private Long pageNo;

    /**
     * 用于前台页面分页
     * 每页记录数
     */
    private Long pageSize;

    /**
     * 用于bootstraptable分页
     * 偏移量（开始索引）
     */
    private Long offset;

    /**
     * 用于bootstraptable分页
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

    /**
     * @return 一共有多少页
     */
    public Long getTotalPage() {
        if(!(total == null || pageSize == null)) {
            return (total) % pageSize == 0 ? (total) / pageSize : (total) / pageSize + 1;
        }else{
            return 1L;
        }
    }

    /**
     * 初始化pageSize和pageNo
     * @param pageNo
     * @param pageSize
     * @return
     */
    public static Pager initNoSize(Long pageNo, Long pageSize){
        Pager pager = new Pager();
        pager.setPageNo(pageNo);
        pager.setPageSize(pageSize);
        return pager;
    }

    /**
     * 用于前台分页
     * (当前显示页-1)*每页显示的个数
     * @return 开始索引
     */
    public Long getBeginIndex() {
        if(!(pageNo == null || pageSize == null)) {
            return (pageNo - 1) * pageSize;
        }else{
            return 0L;
        }
    }

    public Long getPageNo() {
        return pageNo;
    }

    public void setPageNo(Long pageNo) {
        this.pageNo = pageNo;
    }

    public Long getPageSize() {
        return pageSize;
    }

    public void setPageSize(Long pageSize) {
        this.pageSize = pageSize;
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