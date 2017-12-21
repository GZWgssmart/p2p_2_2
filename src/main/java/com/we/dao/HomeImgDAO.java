package com.we.dao;

import com.we.bean.HomeImg;

public interface HomeImgDAO extends BaseDAO {
    int removeById(Integer hid);

    int save(HomeImg record);

    int saveSelective(HomeImg record);

    HomeImg getById(Integer hid);

    int updateSelective(HomeImg record);

    int update(HomeImg record);
}