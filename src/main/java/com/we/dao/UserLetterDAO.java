package com.we.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserLetterDAO extends BaseDAO {

    /***
     *
     * @param ids 多个Id
     * @param status 信息的状态
     * @return 影响的行数
     */
    Integer updateStatus(@Param("ids") List<Integer> ids, @Param("status") Integer status);

    /**
     * 添加站内信时需添加 此站内信与所有前台用户的关联数据
     * @param uidList 前台用户id集合
     * @param lid 站内信id
     * @return 影响行数
     */
    Integer saveRelation(@Param("uidList") List<Integer> uidList, @Param("lid") Integer lid);

}
