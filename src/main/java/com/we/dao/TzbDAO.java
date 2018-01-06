package com.we.dao;

import com.we.bean.Tzb;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TzbDAO extends BaseDAO {


    /**
     * 查询投资总额
     * @return www
     */
    Long countAllMoney();

    /**
     * 月投资人数
     */
    Long countUid(@Param("beginTime") String beginTime, @Param("endTime") String endTime);
}