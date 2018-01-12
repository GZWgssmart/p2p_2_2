package com.we.service;

/**
 * Created by hasee on 2017/12/22.
 */
public interface TicketService extends BaseService {

    /**
     * 批量删除优惠券
     * @param ticketIds
     */
    void deletes(String ticketIds);
}
