package com.we.service;

import com.we.bean.RzvipCheck;

/**
 * Created by hasee on 2017/12/22.
 */
public interface RzvipCheckService extends BaseService {

    /**
     * 通过uid查询审核状态
     */
    RzvipCheck getByUid(Integer uid);

}
