package com.we.controller;


import com.we.bean.Notice;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.NoticeService;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    private NoticeService noticeService;

    //跳转到最新公告页面
    @RequestMapping("notice_page")
    public String page() {
        return null;
    }

    @PostMapping("save")
    @ResponseBody
    public RequestResultVO save(Notice notice) {
        RequestResultVO vo = null;
        try{
            noticeService.saveSelective(notice);
            vo = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        return vo;
    }

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(Notice notice, BindingResult bindingResult) {
        RequestResultVO vo = null;
        try{
            if(bindingResult.hasErrors()) {
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
            }else{
                noticeService.updateSelective(notice);
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
            }
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }

    @RequestMapping("page_criteria")
    @ResponseBody
    public Pager pager(Long offset,Long limit,Notice notice) {
        return noticeService.listCriteria(offset,limit,notice);
    }

    @Resource
    public void setNoticeService(NoticeService noticeService) {
        this.noticeService = noticeService;
    }
}
