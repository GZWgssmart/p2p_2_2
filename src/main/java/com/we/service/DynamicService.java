package com.we.service;

import com.we.vo.DynamicVO;

import java.util.List;

/**
 * Created by ID.LQF on 2017/12/22.
 */
public interface DynamicService extends BaseService {

    /**
     * 查询前4个公司动态
     * @return
     */
    List<DynamicVO> listDynamic();

}
