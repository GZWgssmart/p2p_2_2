package com.we.dao;

import com.we.bean.Borrowapply;
import com.we.common.Pager;
import com.we.vo.BorrowCheckOkVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BorrowapplyDAO extends BaseDAO {

    /**
     * 总贷款人数
     * @return
     */
    Long countAllBorrowUse();

    /**
     * 总贷款人数
     * @return
     */
    Long countMonthBorrowUse(@Param("beginTime") String beginTime, @Param("endTime") String endTime);

    /**
     * 总贷款笔数
     * @return
     */
    Long countAllBorrow();

    /**
     * 月贷款笔数
     * @return
     */
    Long countMonthBorrow(@Param("beginTime") String beginTime, @Param("endTime") String endTime);

    /**
     * 查询所有正在投标申请借款表
     * @return
     */
    List<Borrowapply> getAllBorrowapplyByStateAndDeadline(String nowTime);

    /**
     * 通过baid批量修改状态 为流标
     * @param baids
     */
    void updateStateByBaid(List<Integer> baids);

    /**
     * 前台用户查询自己已发布的借款
     * @param pager
     * @param query
     * @return
     */
    List<Object> listCheckOkBorrow(@Param("pager") Pager pager, @Param("query") Object query);

    /**
     * 计数：前台用户发布的借款
     * @param query
     * @return
     */
    Long countCheckOkBorrow(@Param("query") Object query);
}