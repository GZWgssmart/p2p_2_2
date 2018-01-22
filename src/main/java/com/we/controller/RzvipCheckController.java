package com.we.controller;

import com.we.bean.Huser;
import com.we.bean.RzvipCheck;
import com.we.common.Pager;
import com.we.common.UserUtils;
import com.we.service.RzvipCheckService;
import com.we.vo.CheckVipVO;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/rzvip")
public class RzvipCheckController {

    @Autowired
    private RzvipCheckService rzvipCheckService;

    /***
     * 查询所有VIP
     * @param offset
     * @param limit
     * @return
     */
    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager queryCriteria(Long offset, Long limit, RzvipCheck rzvipCheck) {
        return rzvipCheckService.listCriteria(offset, limit, rzvipCheck);
    }

    @RequestMapping("get_rzvip_by_uid")
    @ResponseBody
    public RzvipCheck getByUid(Integer uid){
        RzvipCheck rzvipCheck = rzvipCheckService.getByUid(uid);
        if(rzvipCheck == null){
            rzvipCheck = new RzvipCheck();
        }
        return rzvipCheck;
    }
    /**
     * 后台用户审核所有的vip(审核不通过，审核通过)
     * @param rzvipCheck
     * @param session
     * @return
     */
    @RequestMapping("check")
    @ResponseBody
    public RequestResultVO vo(RzvipCheck rzvipCheck, HttpSession session) {
        Huser huser = UserUtils.getHuser(session);
        rzvipCheck.setHuid(huser.getHuid());
        return rzvipCheckService.updateCheck(rzvipCheck);
    }


}
