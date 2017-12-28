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
    Integer updateStatus(@Param("ids") List<Integer> ids, @Param("status") String status);

}
