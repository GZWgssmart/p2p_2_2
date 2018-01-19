package com.we.dao;

import com.we.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MoneyLogDAO extends BaseDAO {

    /**
     * 根据时间分页查询
     * @param pager 分页对象
     * @param object 条件对象
     * @return 查询结果
     */
    List<Object> listQueryDate(@Param("pager") Pager pager, @Param("query") Object object);

    /**
     * 根据时间计数
     *
     * @param obj 条件对象
     * @return 结果总数
     */
    Long countQueryDate(@Param("query") Object obj);

}