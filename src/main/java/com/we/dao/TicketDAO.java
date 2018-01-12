package com.we.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface TicketDAO extends BaseDAO {

    void deletes(@Param("ticketIds") List<Integer> ticketIds);
}