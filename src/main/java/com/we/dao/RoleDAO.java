package com.we.dao;

import com.we.bean.Role;
import com.we.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface RoleDAO extends BaseDAO {

    void saveRoleJur(@Param("roleId") Integer roleId,@Param("jurIds") List<Integer> jurIds);

    List<Object> listPager(@Param("pager") Pager pager);

    Long countAll();

    @Override
    List<Object> listCriteria(@Param("pager") Pager pager,@Param("query") Object object);


}