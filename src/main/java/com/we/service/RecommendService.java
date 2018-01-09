package com.we.service;

import com.we.common.Pager;

/**
 * Created by 123456 on 2017/12/22.
 */
public interface RecommendService extends BaseService{

    /**
     * 查询用户推荐了那些好友
     * @param offset 开始索引
     * @param limit 查询数
     * @param object 条件对象
     * @return 分页对象
     */
    Pager listUserFriends(Long offset, Long limit, Object object);

}
