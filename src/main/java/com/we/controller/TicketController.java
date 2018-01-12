package com.we.controller;

import com.we.bean.Ticket;
import com.we.bean.UserTicket;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.TicketService;
import com.we.service.UserTicketService;
import com.we.vo.RequestResultVO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Controller
@RequestMapping("/ticket")
public class TicketController {

    @Autowired
    private TicketService ticketService;
    @Autowired
    private UserTicketService userTicketService;

    @RequestMapping("all_ticket_page")
    public String allTicketPage(){
        return "ticket/all_ticket_page";

    }

    @RequestMapping("add_by_admin")
    @ResponseBody
    public RequestResultVO addByAdmin(String tkmoney,String tktime){
        try{
            Ticket ticket = new Ticket();
            ticket.setCreateTime(Calendar.getInstance().getTime());
            ticket.setType(OurConstants.TICKET_RELEASE);
            ticket.setTktime(new SimpleDateFormat("yyyy-MM-dd").parse(tktime));
            ticket.setTkmoney(BigDecimal.valueOf(Double.valueOf(tkmoney)));
            ticketService.save(ticket);
            return RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        }catch (Exception e){
            return RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }

    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset,Long limit,Integer type,String tkmoney,String tktime,String createTime){
        try {
            Ticket ticket = new Ticket();
            if(type != null || (tkmoney != null && tkmoney != "")|| (tktime != null && tktime != "") || (createTime != null && createTime != "")){
                ticket.setType(type);
                if(tktime != ""){
                    ticket.setTktime(new SimpleDateFormat("yyyy-MM-dd").parse(tktime));
                }
                if(createTime != ""){
                    ticket.setCreateTime(new SimpleDateFormat("yyyy-MM-dd").parse(createTime));
                }
                if(tkmoney != ""){
                ticket.setTkmoney(BigDecimal.valueOf(Double.valueOf(tkmoney)));
                }
            }
            return ticketService.listCriteria(offset,limit,ticket);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping("deletes")
    @ResponseBody
    public RequestResultVO deletes(String ticketIds){
        ticketService.deletes(ticketIds);
        userTicketService.deletesByTicketId(ticketIds);
        return RequestResultVO.status(RequestResultEnum.REMOVE_SUCCESS);
    }
}
