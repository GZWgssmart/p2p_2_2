package com.we.controller;


import com.we.bean.Notice;
import com.we.bean.UserLetter;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.NoticeService;
import com.we.vo.NoticeVO;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    private NoticeService noticeService;

    /**
     * 分页查询所有公司动态
     * @return
     */
    @RequestMapping("pager_notice")
    @ResponseBody
    public Pager pageMedia(Long pageNo, Long pageSize) {
        Pager pager = noticeService.pageNotice(pageNo,pageSize);
        return pager;
    }



    @RequestMapping("detail")
    @ResponseBody
    public Notice getNoticeDetail(Integer nid) {
        return (Notice) noticeService.getById(nid);
    }

    /***
     * 更新最新公告
     * @param notice
     * @return
     */
    @RequestMapping("update_huser")
    @ResponseBody
    public RequestResultVO updatePager(Notice notice) {
        RequestResultVO resultVO = null;
        try {
            noticeService.updateSelective(notice);
            resultVO = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
        } catch (RuntimeException e) {
            e.printStackTrace();
            resultVO = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return resultVO;
    }

    @PostMapping("save")
    @ResponseBody
    public RequestResultVO save(Notice notice) {
        RequestResultVO vo = null;
        try{
            notice.setDate(Calendar.getInstance().getTime());
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
    @RequestMapping("huser_pager_criteria")
    @ResponseBody
    public Pager huserPagerCriteria(Long offset,Long limit,Notice notice) {
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

    /**
     * 页面显示平台公告数据
     * @param offset
     * @param limit
     * @param userLetter
     * @return
     */
    @RequestMapping("pager_all_criteria")
    @ResponseBody
    public Pager pagerAllCriteria(Long offset, Long limit, UserLetter userLetter) {
        return noticeService.listAllPagerNotice(offset,limit, userLetter);
    }

    @RequestMapping("pager_query_criteria")
    @ResponseBody
    public List<Notice> pagerQueryAllCriteria() {
        List<Notice> notices = noticeService.listQueryAllNotice();
        System.out.println("1234567");
        return notices;
    }

    /**
     * 查询前4个最新公告
     * @return
     */
    @RequestMapping("list_notice")
    @ResponseBody
    public List<NoticeVO> listNotice() {
        List<NoticeVO> notices = noticeService.listNotice();
        return notices;
    }

    @Resource
    public void setNoticeService(NoticeService noticeService) {
        this.noticeService = noticeService;
    }
}
