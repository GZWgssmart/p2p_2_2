package com.we.dao;

import com.we.bean.Tzb;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    /**
     * 通过流标查询所有流标的参与用户的id
     * @param baid
     * @return
     */
    List<Integer>  getAllUidByBaid(List<Integer> baid);

    /**
     * 该用户在本次流标中的总投资金额
     * @param baid
     * @param uid
     * @return
     */
    Double getAllMoneyByuid(@Param("baid") List<Integer> baid, @Param("uid") Integer uid);

    /**
     * 查询总交易笔数
     */
    Integer countDealNumber();
}