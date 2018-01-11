package com.we.controller;

import com.we.bean.Hkb;
import com.we.bean.Media;
import com.we.bean.User;
import com.we.common.EncryptUtils;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.common.PathUtils;
import com.we.enums.RequestResultEnum;
import com.we.service.HkbService;
import com.we.service.MediaService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;

/**
 * Created by ID.LQF on 2018/1/2.
 */
@Controller
@RequestMapping("/hkb")
public class HkbController {

    @Autowired
    private HkbService hkbService;

    /**
     * 根据还款id、支付密码执行还款操作
     * @param pwd 支付密码
     * @param skid 还款id
     * @param session
     * @return
     */
    @PostMapping("repayment")
    @ResponseBody
    public RequestResultVO checkZpwd(String pwd, Integer skid, HttpSession session) {
        RequestResultVO resultVO = null;
        User user = (User) session.getAttribute(OurConstants.SESSION_IN_USER);
        try {
            if (EncryptUtils.md5(pwd).equals(user.getZpwd())) {
                resultVO = hkbService.repayment(user.getUid(), skid);
            } else {
                resultVO = RequestResultVO.status(RequestResultEnum.HK_FAIL_ZPWD);
            }
        } catch (RuntimeException e) {
            e.printStackTrace();
            resultVO = RequestResultVO.status(RequestResultEnum.HK_FAIL);
        }
        return resultVO;
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit, Hkb hkb) {
        return hkbService.listCriteria(offset,limit,hkb);
    }

    @RequestMapping("update")
    @ResponseBody
    public RequestResultVO update(Hkb hkb, MultipartFile file) {
        RequestResultVO resultVO = null;
        try {
            hkbService.updateSelective(hkb);
            resultVO = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
        }catch (RuntimeException e) {
            e.printStackTrace();
            resultVO = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return resultVO;
    }

}
