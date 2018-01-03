package com.we.service.impl;

import com.we.bean.Tzb;
import com.we.bean.Usermoney;
import com.we.dao.TzbDAO;
import com.we.dao.UsermoneyDAO;
import com.we.service.AbstractBaseService;
import com.we.service.TzbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Calendar;

@Service
public class TzbServiceImpl extends AbstractBaseService implements TzbService {

    private TzbDAO tzbDAO;
    private UsermoneyDAO usermoneyDAO;

    @Override
    public Integer save(Object obj) {
        Tzb tzb = (Tzb) obj;
        Integer uid = tzb.getUid();
        Integer result = 0;
        Tzb existTzb = tzbDAO.getByUserBorrow(uid, tzb.getBaid());//未实现
        if (existTzb == null) {
            Usermoney usermoney = usermoneyDAO.getByUid(uid);
            BigDecimal kymoney = usermoney.getKymoney();
            BigDecimal money = tzb.getMoney();
            if (kymoney != null && money != null && kymoney.compareTo(money) != -1) {
                usermoney.setKymoney(kymoney.subtract(money));
                usermoney.setTzmoney(usermoney.getTzmoney().add(money));
//                usermoney.setDsmoney();
//                usermoney.setSymoney();
                result += usermoneyDAO.updateSelective(usermoney);
            }
            tzb.setTime(Calendar.getInstance().getTime());
            tzbDAO.saveSelective(tzb);
        }
        return result;
    }

    @Autowired
    public void setTzbDAO(TzbDAO tzbDAO) {
        super.setBaseDAO(tzbDAO);
        this.tzbDAO = tzbDAO;
    }

    @Autowired
    public void setUsermoneyDAO(UsermoneyDAO usermoneyDAO) {
        this.usermoneyDAO = usermoneyDAO;
    }
}
