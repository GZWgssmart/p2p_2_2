package com.we.dao;

import com.we.bean.Dxmodel;

public interface DxmodelDAO extends BaseDAO {
    int removeById(Integer dxid);

    int save(Dxmodel record);

    int saveSelective(Dxmodel record);

    Dxmodel getById(Integer dxid);

    int updateSelective(Dxmodel record);

    int updateByPrimaryKeyWithBLOBs(Dxmodel record);
}