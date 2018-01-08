package com.we.service;

import com.we.common.Pager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FriendService extends BaseService {

    Pager listAllLetter(Long offset, Long limit, Object query);

    /**
     * 累加所有的站内信
     * @param obj
     * @return
     */
    Long countAllLetter(Object obj);
}
