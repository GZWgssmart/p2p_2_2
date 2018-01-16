package com.we.common;

import com.we.bean.Ticket;
import com.we.bean.UserTicket;

import java.math.BigDecimal;
import java.util.Calendar;

public class TicketUtils {

    /**
     * 生成注册优惠券
     * @return
     */
    public static Ticket createUserRegisterTicket(){
        Ticket ticket = new Ticket();
        Calendar calendar = Calendar.getInstance();
        ticket.setCreateTime(calendar.getTime());
        calendar.add(Calendar.MONTH,3);
        ticket.setTktime(calendar.getTime());
        ticket.setTkmoney(BigDecimal.valueOf(20));
        ticket.setType(OurConstants.TICKET_INVITE);
        return ticket;
    }

    /**
     * 生成userTicket
     * @param userId
     * @param ticketId
     * @return
     */
    public static UserTicket createUserTicket(Integer userId,Integer ticketId){
        UserTicket userTicket = new UserTicket();
        userTicket.setUid(userId);
        userTicket.setState(OurConstants.TICKET_OK);
        userTicket.setKid(ticketId);
        userTicket.setTktime(Calendar.getInstance().getTime());
        return userTicket;
    }
}
