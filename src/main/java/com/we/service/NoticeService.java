package com.we.service;

import com.we.bean.Notice;
import com.we.common.Pager;
import com.we.vo.NoticeVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoticeService extends BaseService {

    /**
     * 分页查询所有平台公告
     * @return
     */
    Pager pageNotice(Long beginIndex,Long pageSize);


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

    /**
     * 页面显示平台公告数据
     * @param offset
     * @param limit
     * @param query
     * @return
     */
    Pager listAllPagerNotice(Long offset, Long limit, Object query);


    /***
     * 页面显示平台公告数据(分页)
     * @param obj
     * @return
     */
    Long countAllPagerNotice(Object obj);

    /**
     * 页面显示平台公告数据(不分页)
     * @param
     * @return
     */
    List<Notice> listQueryAllNotice();

    /**
     * 查询前4个最新公告
     * @return
     */
    List<NoticeVO> listNotice();

}
