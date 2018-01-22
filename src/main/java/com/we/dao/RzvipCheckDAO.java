package com.we.dao;

import com.we.bean.RzvipCheck;
import com.we.vo.CheckVipVO;
import org.springframework.stereotype.Repository;

@Repository

public interface RzvipCheckDAO extends BaseDAO {

    /**
     * ͨ��uid��ѯ���״̬
     */
    RzvipCheck getByUid(Integer uid);

}