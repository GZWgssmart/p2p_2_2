package com.we.dao;

import com.we.bean.RzvipCheck;
import org.springframework.stereotype.Repository;

@Repository

public interface RzvipCheckDAO extends BaseDAO {

    /**
     * 通过uid查询审核状态
     */
    RzvipCheck getByUid(Integer uid);

}