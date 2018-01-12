package com.we.service.impl;

import com.we.dao.TicketDAO;
import com.we.service.AbstractBaseService;
import com.we.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TicketServiceImpl extends AbstractBaseService implements TicketService{

    private TicketDAO ticketDAO;

    @Autowired
    public void setTicketDAO(TicketDAO ticketDAO) {
        super.setBaseDAO(ticketDAO);
        this.ticketDAO = ticketDAO;
    }

    @Override
    public void deletes(String ticketIds) {
        String [] ticketIdsArray = ticketIds.split(",");
        List<Integer> ticketIdsList = new ArrayList<>();
        for (String classId:ticketIdsArray){
            ticketIdsList.add(Integer.valueOf(classId));
        }
        ticketDAO.deletes(ticketIdsList);
    }
}
