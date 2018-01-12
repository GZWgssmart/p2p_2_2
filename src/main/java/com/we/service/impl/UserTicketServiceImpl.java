package com.we.service.impl;

import com.we.bean.UserTicket;
import com.we.dao.UserTicketDAO;
import com.we.service.AbstractBaseService;
import com.we.service.UserTicketService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/1/2.
 */
@Service
public class UserTicketServiceImpl extends AbstractBaseService implements UserTicketService {
    
    private UserTicketDAO userTicketDAO;

    @Resource
    public void setUserTicketDAO(UserTicketDAO userTicketDAO) {
        super.setBaseDAO(userTicketDAO);
        this.userTicketDAO = userTicketDAO;
    }

    @Override
    public UserTicket getByUidKid(Integer uid, Integer kid) {
        return userTicketDAO.getByUidKid(uid, kid);
    }

    @Override
    public void deletesByTicketId(String ticketIds) {
        String [] ticketIdsArray = ticketIds.split(",");
        List<Integer> ticketIdsList = new ArrayList<>();
        for (String classId:ticketIdsArray){
            ticketIdsList.add(Integer.valueOf(classId));
        }
        userTicketDAO.deletesByTicketId(ticketIdsList);
    }
}
