package com.we.dao;

import com.we.bean.Ydate;
import org.springframework.stereotype.Repository;

@Repository

public interface YdateDAO extends BaseDAO {

    /**
     * 通过时间查询运营数据
     * @param time
     * @return
     */
    Ydate getByDate(String time);


}