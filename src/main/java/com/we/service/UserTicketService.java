package com.we.service;

import com.we.bean.UserTicket;

/**
 * Created by hasee on 2017/12/22.
 */
public interface UserTicketService extends BaseService {

    /**
     * 根据uid、kid查询用户是否已经领过此券
     * @param uid 前台用户id
     * @param kid 优惠券id
     * @return 用户与券的关联对象
     */
    UserTicket getByUidKid(Integer uid, Integer kid);

    /**
     * 根据ticketIds 批量删除
     * @param ticketIds
     */
    void deletesByTicketId(String ticketIds);
}
