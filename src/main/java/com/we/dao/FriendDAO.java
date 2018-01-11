package com.we.dao;

import com.we.bean.Friend;
import com.we.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FriendDAO extends BaseDAO {

    List<Object> listAllLetter(@Param("pager") Pager pager,
                               @Param("query") Object object);

    Long countAllLetter(@Param("query")Object obj);

    /**
     * 查询所有的合作伙伴
     * @return
     */
    List<Friend> listFriend();

}