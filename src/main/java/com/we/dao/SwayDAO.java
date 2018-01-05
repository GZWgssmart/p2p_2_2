package com.we.dao;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SwayDAO extends BaseDAO {

    /**
     * 通过多个id 删除
     * @param ids
     */
    void removeByIds(List<Integer> ids);

}