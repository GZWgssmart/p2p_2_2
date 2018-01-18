package com.we.dao;

import com.we.common.Pager;
import com.we.vo.DynamicVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 公司动态
 */
@Repository
public interface DynamicDAO extends BaseDAO {

    /**
     * 查询前4个公司动态
     * @return
     */
    List<DynamicVO> listDynamic();

    /**
     * 分页查询所有公司动态
     * @return
     */
    List<Object> pageDynamic(@Param("pager") Pager pager);

}