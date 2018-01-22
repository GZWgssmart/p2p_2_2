package com.we.dao;

import com.we.bean.RzvipCheck;
import com.we.vo.CheckVipVO;
import org.springframework.stereotype.Repository;

@Repository

public interface RzvipCheckDAO extends BaseDAO {

    /**
     * Í¨¹ýuid²éÑ¯ÉóºË×´Ì¬
     */
    RzvipCheck getByUid(Integer uid);

}