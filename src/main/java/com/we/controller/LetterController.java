package com.we.controller;

import com.we.bean.Letter;
import com.we.bean.UserLetter;
import com.we.bean.UserTicket;
import com.we.common.Pager;
import com.we.common.UserUtils;
import com.we.enums.RequestResultEnum;
import com.we.service.LetterService;
import com.we.vo.RequestResultVO;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.Calendar;

@Controller
@RequestMapping("/letter")
public class LetterController {

    private LetterService letterService;

    /***
     * 更新站内信
     * @param letter
     * @return
     */
    @RequestMapping("update_huser")
    @ResponseBody
    public RequestResultVO update(Letter letter) {
        RequestResultVO resultVO = null;
        if (UserUtils.isAdmin()) {
            try {
                letterService.updateSelective(letter);
                resultVO = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
            } catch (RuntimeException e) {
                e.printStackTrace();
                resultVO = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
            }
        } else {
            resultVO = RequestResultVO.status(RequestResultEnum.NO_PERMISSION);
        }
        return resultVO;
    }

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(@Valid Letter letter, BindingResult bindingResult) {
        RequestResultVO vo = null;
        if (UserUtils.isLogin()) {
            try {
                //判断此letter对象是否不符合Letter类中的注解
                if (bindingResult.hasErrors()) {
                    vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
                } else {
                    letterService.updateSelective(letter);
                    vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
                }
            } catch (RuntimeException e) {
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
            }
        } else {
            vo = RequestResultVO.status(RequestResultEnum.NO_PERMISSION);
        }
        return vo;
    }

    @PostMapping("save")
    @ResponseBody
    public RequestResultVO save(Letter letter) {
        RequestResultVO vo = null;
        if (UserUtils.isAdmin()) {
            try {
                letter.setDate(Calendar.getInstance().getTime());
                letterService.saveSelective(letter);
                vo = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
            } catch (RuntimeException e) {
                e.printStackTrace();
                vo = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
            }
        } else {
            vo = RequestResultVO.status(RequestResultEnum.NO_PERMISSION);
        }
        return vo;
    }

    /**
     * 条件分页查询前台用户的 站内信
     * @param offset 开始索引
     * @param limit 查询个数
     * @param userLetter 用于接收页面传递的uid
     * @return 带结果的分页对象
     */
    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit, UserLetter userLetter) {
        if (UserUtils.isLogin()) {
            return letterService.listCriteria(offset, limit, userLetter);
        }
        return null;
    }

    /**
     * 后台用户查看所有站内信
     * @param offset 开始索引
     * @param limit 查询个数
     * @param letter 用于接收页面传递的uid
     * @return 带结果的分页对象
     */
    @RequestMapping("all_pager_criteria")
    @ResponseBody
    public Pager listAllCriteria(Long offset, Long limit, Letter letter) {
        if (UserUtils.isAdmin()) {
             return letterService.listAllLetter(offset, limit, letter);
        }
        return null;
    }

    @Resource
    public void setLetterService(LetterService letterService) {
        this.letterService = letterService;
    }
}
