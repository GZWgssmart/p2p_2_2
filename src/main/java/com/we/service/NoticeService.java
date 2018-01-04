package com.we.service;

import com.we.common.Pager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoticeService extends BaseService {

    /***
     * 后台管理员查询所有的最新公告
     * @param offset
     * @param limit
     * @param query
     * @return
     */
    Pager listAllNotice(Long offset, Long limit, Object query);

    /***
     * 累加所有的最新公告
     * @param obj
     * @return
     */
    Long countAllNotice(Object obj);
}
