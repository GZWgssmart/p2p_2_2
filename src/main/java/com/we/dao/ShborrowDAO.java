package com.we.dao;

import com.we.bean.Shborrow;
import org.springframework.stereotype.Repository;

@Repository

public interface ShborrowDAO extends BaseDAO {

    /**
     * 根据借款id查询审核数据
     * @param baid 借款id
     * @return 审核对象
     */
    Shborrow getByBaid(Integer baid);
}