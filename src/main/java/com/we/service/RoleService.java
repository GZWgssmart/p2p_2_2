package com.we.service;

import com.we.bean.Role;
import com.we.common.Pager;

import java.util.List;

/**
 * Created by hasee on 2017/12/22.
 */
public interface RoleService extends BaseService {



    /**
     * 分页查询所有权限
     * @param offset 开始索引
     * @param limit 查询数
     * @return
     */
    Pager listPager(Long offset, Long limit);

    /**
     * 批量删除
     */
    void deletes(String roleIds);

    List<Object> listTreeVO();
}
