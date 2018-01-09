package com.we.dao;

import com.we.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 推荐管理
 */
@Repository
public interface RecommendDAO extends BaseDAO {

    /**
     * 查询用户推荐了那些好友
     * @param pager 分页对象
     * @param object 条件对象
     * @return 查询结果
     */
    List<Object> listUserFriends(@Param("pager") Pager pager, @Param("query") Object object);

    /**
     * 条件计数
     * @param obj 条件对象
     * @return 结果总数
     */
    Long countUserFriends(@Param("query") Object obj);

}