package com.we.dao;

import com.we.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface TxLogDAO extends BaseDAO {

    /**
     * 对listCriteria方法的计数，原方法计数不准确
     * @param object
     * @return
     */
    List<Integer> listCount(@Param("query") Object object);

    /**
     * 查询用户的提现记录
     * @param userId
     * @return
     */
    List<Object> listWithdrawalByUserId(@Param("query")Pager pager, @Param("userId") Integer userId);


    Long  countWithdrawalByUserId(@Param("userId") Integer userId);
}