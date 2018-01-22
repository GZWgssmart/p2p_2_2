package com.we.controller;

import com.we.bean.Bankcard;
import com.we.bean.Bankcard;
import com.we.bean.User;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.common.UserUtils;
import com.we.enums.RequestResultEnum;
import com.we.service.BankcardService;
import com.we.vo.ComboboxVO;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/12/25.
 */

@Controller
@RequestMapping("/bankcard")
public class BankcardController {

    private BankcardService bankcardService;

    @RequestMapping("remove/{bcid}")
    @ResponseBody
    public RequestResultVO remove(@PathVariable Integer bcid) {
        Integer result = bankcardService.removeById(bcid);
        if (result == 1) {
            return RequestResultVO.status(RequestResultEnum.UNBIND_SUCCESS);
        }
        return RequestResultVO.status(RequestResultEnum.UNBIND_FAIL);
    }

    @RequestMapping("list_card/{uid}")
    @ResponseBody
    public List<ComboboxVO> listCard(@PathVariable Integer uid) {
        return bankcardService.listCard(uid);
    }

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(@Valid Bankcard bankcard, BindingResult bindingResult) {
        RequestResultVO vo = null;
        try {
            if (bindingResult.hasErrors()) {
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
            } else {
                bankcardService.updateSelective(bankcard);
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
            }
        } catch (RuntimeException e) {
            e.printStackTrace();
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }

    @PostMapping("save")
    @ResponseBody
    public RequestResultVO bindingBankcard(HttpSession session, Bankcard bankcard) {
        User user = UserUtils.getUser(session);
        return bankcardService.save(user, bankcard);
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager allBankcard(Long offset, Long limit, Bankcard bankcard, HttpSession session) {
        User user = UserUtils.getUser(session);
        bankcard.setUid(user.getUid());
        return bankcardService.listCriteria(offset, limit, bankcard);
    }

    @Resource
    public void setBankcardService(BankcardService bankcardService) {
        this.bankcardService = bankcardService;
    }
}