package com.we.service.impl;

import com.we.bean.Bankcard;
import com.we.bean.User;
import com.we.common.Pager;
import com.we.dao.BankcardDAO;
import com.we.dao.BaseDAO;
import com.we.enums.RequestResultEnum;
import com.we.service.AbstractBaseService;
import com.we.service.BankcardService;
import com.we.vo.ComboboxVO;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

/**
 * Created by Administrator on 2017/12/25.
 */
@Service
public class BankcardServiceImpl extends AbstractBaseService implements BankcardService {


    private BankcardDAO bankcardDAO;

    @Resource
    public void setBankcardDAO(BankcardDAO bankcardDAO) {
        this.bankcardDAO = bankcardDAO;
        super.setBaseDAO(bankcardDAO);
    }

    @Override
    public List<ComboboxVO> listCard(Integer uid) {
        return bankcardDAO.listCard(uid);
    }

    @Override
    public RequestResultVO save(User user, Bankcard bankcard) {
        if (user.getRname() == null || user.getIdno() == null
            || "".equals(user.getRname()) || "".equals(user.getIdno())) {
            return RequestResultVO.status(RequestResultEnum.BIND_WITHIOUT_AUTHEN);
        }
        Random random = new Random();
        Integer randomI = random.nextInt(10);
        if (randomI > 2) {
            bankcard.setUid(user.getUid());
            bankcard.setRname(user.getRname());
            bankcard.setIdno(user.getIdno());
            bankcard.setDate(Calendar.getInstance().getTime());
            bankcardDAO.saveSelective(bankcard);
            return RequestResultVO.status(RequestResultEnum.BINDING_BANKCARD_SUCCESS);
        }
        return RequestResultVO.status(RequestResultEnum.BIND_FAIL);
    }
}
