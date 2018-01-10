package com.we.dao;

import com.we.bean.Ydate;
import com.we.vo.YdataVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface YdateDAO extends BaseDAO {

    /**
     * 通过时间查询运营数据
     * @param time
     * @return
     */
    Ydate getByDate(String time);

    /**
     * 查询最近十二个月的运营数据
     */
    List<YdataVo> getYearYdate();

}