package com.we.dao;

import com.we.bean.Tzb;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TzbDAO extends BaseDAO {

    /**
     * 根据用户id，借款id判断用户是否已经对此借款投资
     * @param uid 用户id
     * @param baid 借款id
     * @return 投资记录
     */
    Tzb getByUserBorrow(@Param("uid") Integer uid, @Param("baid") Integer baid);
}