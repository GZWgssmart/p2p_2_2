package com.we.controller;

import com.we.bean.Letter;
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

@Controller
@RequestMapping("/letter")
public class LetterController {

    private LetterService letterService;

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

    @Resource
    public void setLetterService(LetterService letterService) {
        this.letterService = letterService;
    }
}
