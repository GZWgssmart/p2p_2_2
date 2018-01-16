package com.we.dao;

import com.we.common.Pager;
import com.we.vo.InvestHistoryVO;
import com.we.vo.TzbVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
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

    /**
     * 查询出总投资数
     * @return
     */
    List<TzbVO> getAllMoney();

    /**
     * 查询用户对一个标投了的投资总额
     * @param uid 前台用户id
     * @param baid 借款id
     * @return 投资总额
     */
    BigDecimal countUserTzTotal(@Param("uid") Integer uid, @Param("baid") Integer baid);

    /**
     * 查询某借款已筹款金额
     * @param baid
     * @return
     */
    Double sunMoneyByBaid(Integer baid);

    /**
     * 分页查询借款的投资记录
     * @param pager
     * @param borrowId
     * @return
     */
    List<Object> pagerInvestHistoryByBorrowId(@Param("query") Pager pager,@Param("borrowId") Integer borrowId);

    Long countInvestHistoryByBorrowId(Integer borrowId);
}