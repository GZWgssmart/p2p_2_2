package com.we.dao;

import com.we.bean.Notice;
import org.springframework.stereotype.Repository;

@Repository
public interface NoticeDAO extends BaseDAO {
    int removeById(Integer nid);

    int save(Notice record);

    int saveSelective(Notice record);

    Notice getById(Integer nid);

    int updateSelective(Notice record);

    int updateByPrimaryKeyWithBLOBs(Notice record);

    int update(Notice record);
}