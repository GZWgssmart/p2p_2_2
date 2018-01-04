package com.we.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HuserDAO extends BaseDAO {

    void deletes(@Param("huserIds") List<Integer> huserIds);
}