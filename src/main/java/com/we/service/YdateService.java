package com.we.service;

import com.we.bean.Ydate;
import com.we.vo.YdataVO;

import java.util.List;

/**
 * Created by hasee on 2017/12/22.
 */
public interface YdateService extends BaseService {

    /**
     * 通过时间查询运营数据
     * @param time
     * @return
     */
    Ydate getByDate(String time);

    /**
     * 查询最近十二个月的运营数据
     */
    List<YdataVO> getYearYdate();



}
