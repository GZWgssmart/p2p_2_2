package com.we.controller;

import com.we.bean.Tzb;
import com.we.bean.User;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.dto.TzbDTO;
import com.we.enums.RequestResultEnum;
import com.we.exception.InvestException;
import com.we.service.TzbService;
import com.we.vo.RequestResultVO;
import com.we.vo.TzbVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

/**
 * Created by hasee on 2017/12/25.
 */
@Controller
@RequestMapping("/tzb")
public class TzbController {

    private TzbService tzbService;
    private Logger logger = LoggerFactory.getLogger(TzbController.class);

    @PostMapping("save")
    @ResponseBody
    public RequestResultVO save(TzbDTO tzb) {
        RequestResultVO vo = null;
        try{
            tzbService.save(tzb);
            vo = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        } catch (InvestException e){
            logger.error(e.getMessage());
            e.printStackTrace();
            vo = new RequestResultVO(e.getCode(), "fail", e.getMessage());
        } catch (RuntimeException e) {
            logger.error(e.getMessage());
            e.printStackTrace();
            vo = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        return vo;
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit, Tzb tzb, HttpSession session) {
        User user = (User) session.getAttribute(OurConstants.SESSION_IN_USER);
        tzb.setUid(user.getUid());
        return tzbService.listCriteria(offset, limit, tzb);
    }

    @RequestMapping("get_money")
    @ResponseBody
    public TzbVO getMoney() {
        List<TzbVO> tzbVOList = tzbService.getAllMoney();
        BigDecimal allMoney = null;
        for (TzbVO tzbVO : tzbVOList) {
            BigDecimal money = tzbVO.getMoney();
            if (allMoney !=null ) {
                allMoney = money.add(allMoney);
            } else {
                allMoney = money;
            }
        }
        TzbVO tzbVO = new TzbVO();
        tzbVO.setAllMoney(allMoney);
        return tzbVO;
    }

    @RequestMapping("pager_invest_history_by_borrowId/{borrowId}")
    @ResponseBody
    public Pager pagerInvestHistory(@PathVariable Integer borrowId){
        return tzbService.listCriteria(null,null,null);
    }

    @Resource
    public void setTzbService(TzbService tzbService) {
        this.tzbService = tzbService;
    }
}
