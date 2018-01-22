package com.we.service;

import com.we.bean.RzvipCheck;

import com.we.bean.RzvipCheck;
import com.we.vo.CheckVipVO;
import com.we.vo.RequestResultVO;

/**
 * Created by hasee on 2017/12/22.
 */
public interface RzvipCheckService extends BaseService {

    /**
     * 通过uid查询审核状态
     */
    RzvipCheck getByUid(Integer uid);


    /**
     * 更新vip状态
     * @return
     */
    RequestResultVO updateCheck(RzvipCheck rzvipCheck);
}
