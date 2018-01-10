package com.we.dao;

import com.we.bean.UserTicket;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserTicketDAO extends BaseDAO {

    /**
     * 根据uid、kid查询用户是否已经领过此券
     * @param uid 前台用户id
     * @param kid 优惠券id
     * @return 用户与券的关联对象
     */
    UserTicket getByUidKid(@Param("uid") Integer uid, @Param("kid") Integer kid);
}