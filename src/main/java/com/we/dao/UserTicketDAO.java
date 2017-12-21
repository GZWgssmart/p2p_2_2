package com.we.dao;

import com.we.bean.UserTicket;

public interface UserTicketDAO extends BaseDAO {
    int removeById(Integer rwid);

    int save(UserTicket record);

    int saveSelective(UserTicket record);

    UserTicket getById(Integer rwid);

    int updateSelective(UserTicket record);

    int update(UserTicket record);
}