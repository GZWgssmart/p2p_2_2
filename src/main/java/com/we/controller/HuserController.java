package com.we.controller;

import com.we.bean.Huser;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.HuserService;
import com.we.service.RoleuserService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by ID.LQF on 2017/12/25.
 */
@Controller
@RequestMapping("/huser")
public class HuserController {

    @Autowired
    private HuserService huserService;
    @Autowired
    private RoleuserService roleuserService;

    @RequestMapping("notice_pager")
    public String allNoticePager() {
        return "notice/all_notice";
    }

    @RequestMapping("all_shborrow_page")
    public String allBorrowCheckPage() {
        return "huser/shborrow/all_shborrow";
    }

    @RequestMapping("all_letter_page")
    public String allLetterPage() {
        return "huser/letter/all_letter";
    }

    @RequestMapping("home_page")
    public String home() {
        return "huser/home";
    }

    @RequestMapping("all_dynamic_page")
    public String allDynamicPage() {
        return "huser/dynamic/all_dynamic";
    }

    @RequestMapping("all_media_page")
    public String allMediaPage() {
        return "huser/media/all_media";
    }

    @RequestMapping("all_homeimg_page")
    public String allHomeImgPage() {
        return "huser/homeimg/all_homeimg";
    }

    @RequestMapping("all_admin_page")
    public String allAdminPage() {
        return "huser/allAdmin";
    }

    @RequestMapping("add_huser_page")
    public String addHuserPage() {
        return "huser/add_huser";
    }


    @ResponseBody
    @RequestMapping("list_pager")
    public Pager listPager(Long offset, Long limit) {
        Pager pager = huserService.listCriteria(offset, limit, Huser.class);
        return pager;
    }

    /***
     * 条件分页查询用户 站内信
     * @param offset 开始索引
     * @param limit 查询个数
     * @param huser 用于接收页面传替的huid
     * @return 带结果的分页的对象
     */
    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset,Long limit,Huser huser) {
        return huserService.listCriteria(offset,limit,huser);
    }

    @RequestMapping("add")
    @ResponseBody
    public RequestResultVO add(Huser huser, String roleIds) {
        huserService.save(huser);
        roleuserService.saveRoleuser(huser.getHuid(),roleIds);
        return RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
    }

    @RequestMapping("update")
    @ResponseBody
    public RequestResultVO update(Huser huser, String roleIds) {
        huserService.update(huser);
        roleuserService.deletes(String.valueOf(huser.getHuid()));
        roleuserService.saveRoleuser(huser.getHuid(),roleIds);
        return RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
    }

    @RequestMapping("deletes")
    @ResponseBody
    public RequestResultVO deletes(String huserIds) {
        huserService.deletes(huserIds);
        roleuserService.deletes(huserIds);
        return RequestResultVO.status(RequestResultEnum.REMOVE_SUCCESS);
    }



}
