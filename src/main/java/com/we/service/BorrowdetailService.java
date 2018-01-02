package com.we.service;

import com.we.bean.Borrowdetail;

/**
 * Created by hasee on 2017/12/22.
 */
public interface BorrowdetailService extends BaseService {

    /**
     * 根据借款基本信息的id 查询详情，
     * @param baid 基本信息id
     * @return 详情
     */
    Borrowdetail getByApplyId(Integer baid);
}
