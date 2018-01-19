package com.we.dao;

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

}