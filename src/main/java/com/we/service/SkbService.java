package com.we.service;

import com.we.common.Pager;
import com.we.vo.RequestResultVO;

/**
 * Created by hasee on 2017/12/22.
 */
public interface SkbService extends BaseService {

    /**
     * 用户查看 收款列表，无数据则生成
     * @param offset
     * @param limit
     * @param object
     * @return
     */
    Pager saveListCriteria(Long offset, Long limit, Object object);

    /**
     * 用户选中 一行数据进行收款
     * @param uid
     * @param skid
     * @return
     */
    RequestResultVO saveGathering(Integer uid, Integer skid);
}
