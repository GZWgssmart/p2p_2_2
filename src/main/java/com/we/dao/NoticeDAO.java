package com.we.dao;

import com.we.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NoticeDAO extends BaseDAO {

    List<Object> listAllNoticer(@Param("pager") Pager pager,
                               @Param("query") Object object);

    Long countAllNotice(@Param("query")Object obj);
}