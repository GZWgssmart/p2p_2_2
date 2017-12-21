package com.we.dao;

import com.we.bean.Ticket;

public interface TicketDAO extends BaseDAO {
    int removeById(Integer umid);

    int save(Ticket record);

    int saveSelective(Ticket record);

    Ticket getById(Integer umid);

    int updateSelective(Ticket record);

    int update(Ticket record);
}