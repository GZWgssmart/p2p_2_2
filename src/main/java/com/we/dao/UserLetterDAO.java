package com.we.dao;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserLetterDAO extends BaseDAO {

    /***
     * 删除选中的多行数据
     * @param ids 多个id
     * @return 影响行数
     */
    Integer removeRows(String ids);
}
