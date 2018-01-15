package com.we.dao;

import com.we.bean.Skb;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SkbDAO extends BaseDAO {

    /**
     * 判断用户是否已经生成此借款的还款表数据
     * @param uid 前台用户id
     * @param baid 借款id
     * @return 大于0为已生成，0为未生成
     */
    Long countUserBorrow(@Param("uid")Integer uid, @Param("baid") Integer baid);

    /**
     * 用户查看收款列表时，若无数据则生成收款表数据
     * @param skbList 收款List
     * @return 影响行数
     */
    Integer saveList(@Param("skbList") List<Object> skbList);
}