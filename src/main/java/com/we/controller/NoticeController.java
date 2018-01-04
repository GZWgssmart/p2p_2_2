package com.we.controller;


import com.we.bean.Notice;
import com.we.bean.UserLetter;
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

    /**
     * 后台用户查看所有站内信
     * @param offset 开始索引
     * @param limit 查询个数
     * @param notice 用于接收页面传递的uid
     * @return 带结果的分页对象
     */
    @RequestMapping("all_pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset,Long limit,Notice notice) {
        return noticeService.listAllNotice(offset,limit,notice);
    }

    /***
     * 前台用户查看所有的最新公告
     * @param offset 开始搜引
     * @param limit 查询个数
     * @param userLetter 用户接收页面传替过来的uid
     * @return 返回带有结果的分页对象
     */
    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit, UserLetter userLetter) {
        return noticeService.listCriteria(offset,limit, userLetter);
    }

    @Resource
    public void setNoticeService(NoticeService noticeService) {
        this.noticeService = noticeService;
    }
}
