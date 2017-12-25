package com.we.dao;

import com.we.bean.Jur;
import com.we.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JurDAO extends BaseDAO {

    List<Object> listPager(@Param("pager") Pager pager);

    Long countAll();

    List<Object> listByRoleId(Integer roleId);
}