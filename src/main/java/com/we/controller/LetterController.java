package com.we.controller;

import com.we.bean.Letter;
import com.we.bean.UserLetter;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.LetterService;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.Calendar;

@Controller
@RequestMapping("/letter")
public class LetterController {

    private LetterService letterService;

    @RequestMapping("index_pager")
    public String pager() {
        return "user/index_details";
    }

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(@Valid Letter letter, BindingResult bindingResult) {
        RequestResultVO vo = null;
        try {
            //判断此letter对象是否不符合Letter类中的注解
            if (bindingResult.hasErrors()) {
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
            } else {
                letterService.updateSelective(letter);
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
            }
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }

    @PostMapping("save")
    @ResponseBody
    public RequestResultVO save(Letter letter) {
        RequestResultVO vo = null;
        try{
            letter.setDate(Calendar.getInstance().getTime());
            letterService.saveSelective(letter);
            vo = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        return vo;
    }

    /**
     * 条件分页查询用户的 站内信
     * @param offset 开始索引
     * @param limit 查询个数
     * @param userLetter 用于接收页面传递的uid
     * @return 带结果的分页对象
     */
    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pager(Long offset, Long limit, UserLetter userLetter) {
        return letterService.listCriteria(offset,limit, userLetter);
    }

    @Resource
    public void setLetterService(LetterService letterService) {
        this.letterService = letterService;
    }
}
