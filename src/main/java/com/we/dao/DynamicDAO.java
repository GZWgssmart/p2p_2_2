package com.we.dao;

import com.we.vo.DynamicVO;
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

}