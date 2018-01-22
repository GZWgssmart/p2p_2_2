package com.we.service.impl;

import com.we.bean.RzvipCheck;
import com.we.bean.RzvipCheck;
import com.we.bean.User;
import com.we.common.OurConstants;
import com.we.dao.HuserDAO;
import com.we.dao.RzvipCheckDAO;
import com.we.dao.UserDAO;
import com.we.enums.RequestResultEnum;
import com.we.service.AbstractBaseService;
import com.we.service.RzvipCheckService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;

@Service
public class RzvipCheckServiceImpl extends AbstractBaseService implements RzvipCheckService {

    @Autowired
    private RzvipCheckDAO rzvipCheckDAO;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private HuserDAO huserDAO;

    @Autowired
    public void setUserDAO(RzvipCheckDAO rzvipCheckDAO) {
        super.setBaseDAO(rzvipCheckDAO);
        this.rzvipCheckDAO = rzvipCheckDAO;
    }


    @Override
    public RzvipCheck getByUid(Integer uid) {
        return rzvipCheckDAO.getByUid(uid);
    }
    /**
     * 后台去更新rzvip_check表的状态
     * @param rzvipCheck
     * @return
     */
    @Override
    public RequestResultVO updateCheck(RzvipCheck rzvipCheck) {
        RequestResultVO vo = null;
        rzvipCheck.setDate(Calendar.getInstance().getTime());
        rzvipCheckDAO.update(rzvipCheck);
        if(OurConstants.VIP_CHECK_OK.equals(rzvipCheck.getIsok())) {
            User user = (User) userDAO.getById(rzvipCheck.getUid());
            user.setIsVip(OurConstants.IS_VIP);
            userDAO.update(user);
            vo = RequestResultVO.status(RequestResultEnum.CHECK_OK);
        }else {
            vo = RequestResultVO.status(RequestResultEnum.CHECK_NO);
        }
        return vo;
    }
}
