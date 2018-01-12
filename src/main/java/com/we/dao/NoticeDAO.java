package com.we.dao;

import com.we.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NoticeDAO extends BaseDAO {

    List<Object> listAllNotice(@Param("pager") Pager pager,
                               @Param("query") Object object);

    Long countAllNotice(@Param("query")Object obj);

    List<Object> listAllPageNotice(@Param("pager") Pager pager,@Param("query") Object object);

    Long countAllPagerNotice(@Param("query") Object object);
}