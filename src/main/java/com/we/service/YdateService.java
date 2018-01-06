package com.we.service;

import com.we.bean.Ydate;

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

}
