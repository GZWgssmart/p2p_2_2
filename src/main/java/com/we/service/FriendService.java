package com.we.service;

import com.we.bean.Friend;
import com.we.common.Pager;

import java.util.List;

public interface FriendService extends BaseService {

    Pager listAllLetter(Long offset, Long limit, Object query);

    /**
     * 累加所有的站内信
     * @param obj
     * @return
     */
    Long countAllLetter(Object obj);

    /**
     * 查询所有的合作伙伴
     * @return
     */
    List<Friend> listFriend();

}
