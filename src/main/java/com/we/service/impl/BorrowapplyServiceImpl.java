package com.we.service.impl;

import com.we.bean.Borrowapply;
import com.we.bean.Hkb;
import com.we.bean.Shborrow;
import com.we.bean.Usermoney;
import com.we.common.DateUtil;
import com.we.common.Pager;
import com.we.dao.*;
import com.we.service.AbstractBaseService;
import com.we.service.BorrowapplyService;
import com.we.service.HkbService;
import com.we.service.UsermoneyService;
import com.we.vo.BorrowdetailAndWapplyVO;
import com.we.vo.BorrowapplyInvestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created on 2017/12/25 11:13
 *
 * @author mh
 */
@Service
public class BorrowapplyServiceImpl extends AbstractBaseService implements BorrowapplyService {

    private BorrowapplyDAO borrowapplyDAO;
    private ShborrowDAO shborrowDAO;
    @Autowired
    private TzbDAO tzbDAO;
    @Autowired
    private UsermoneyDAO usermoneyDao;
    @Autowired
    private HkbDAO hkbDAO;

    @Override
    public Integer saveSelective(Object obj) {
        Integer i1 = borrowapplyDAO.saveSelective(obj);
        Borrowapply borrowapply = (Borrowapply) obj;
        Shborrow shborrow = new Shborrow();
        shborrow.setBaid(borrowapply.getBaid());
        Integer i2 = shborrowDAO.saveSelective(shborrow);
        return i1 + i2;
    }

    @Override
    public Long countAllBorrowUse() {
        return borrowapplyDAO.countAllBorrowUse();
    }

    @Override
    public Long countMonthBorrowUse(String beginTime, String endTime) {
        return borrowapplyDAO.countMonthBorrowUse(beginTime, endTime);
    }

    @Override
    public Long countAllBorrow() {
        return borrowapplyDAO.countAllBorrow();
    }

    @Override
    public Long countMonthBorrow(String beginTime, String endTime) {
        return borrowapplyDAO.countMonthBorrow(beginTime, endTime);
    }

    @Override
    public void floater() {
        String nowTime = DateUtil.getNowTime();
        //查询所有流标借款
        List<Borrowapply> borrowapplyList = borrowapplyDAO.getAllBorrowapplyByStateAndDeadline(nowTime);
        //所有流标的借款id
        List<Integer> baids = new ArrayList<>();
        for (Borrowapply borrowapply : borrowapplyList) {
            //修改此标状态
            baids.add(borrowapply.getBaid());
        }
        if(borrowapplyList.size() != 0) {
            //所有投资用户
            List<Integer> uids = tzbDAO.getAllUidByBaid(baids);
            for (Integer uid : uids) {
                //该用户在本次流标中的总投资金额
                Double money = tzbDAO.getAllMoneyByuid(baids, uid);
                //修改用户资金表的待收金额
                Usermoney usermoney = usermoneyDao.getByUid(uid);
                if (usermoney != null) {
                    Usermoney usermoney1 = new Usermoney();
                    if (usermoney.getDsmoney() == null || BigDecimal.ZERO.equals(usermoney.getDsmoney())) {
                        usermoney1.setUid(uid);
                        usermoney1.setDsmoney(BigDecimal.valueOf(money));
                    } else {
                        usermoney1.setUid(uid);
                        usermoney1.setDsmoney(usermoney.getDsmoney().add(BigDecimal.valueOf(money)));
                    }
                    usermoneyDao.updateByUid(usermoney1);
                }
            }
            ///修改此标状态为流标
            borrowapplyDAO.updateStateByBaid(baids);
        }
    }

    @Override
    public void overdue() {
        String nowTime = DateUtil.getNowTime();
        List<Hkb> hkbList = hkbDAO.getAllOverdue(nowTime);
        Hkb hkbUpdate = new Hkb();
        for(Hkb hkb : hkbList){
            hkbUpdate.setSkid(hkb.getSkid());
            //每日罚息
            if(hkb.getYfx() ==  null || BigDecimal.ZERO.equals(hkb.getYfx())){
                hkbUpdate.setYfx(hkb.getYlx().divide(BigDecimal.valueOf(30), 2, RoundingMode.CEILING));
            }else{
                hkbUpdate.setYfx(hkb.getYlx().divide(BigDecimal.valueOf(30), 2, RoundingMode.CEILING).add(hkb.getYfx()));
            }
            hkbDAO.updateSelective(hkbUpdate);
        }
    }

    @Override
    public Pager listCheckOkBorrow(Long offset, Long limit, Object query) {
        Pager pager = new Pager(offset, limit);
        pager.setRows(borrowapplyDAO.listCheckOkBorrow(pager, query));
        pager.setTotal(borrowapplyDAO.countCheckOkBorrow(query));
        return pager;
    }

    @Override
    public Pager listUserInvest(Long offset, Long limit, Object query) {
        Pager pager = new Pager(offset, limit);
        pager.setRows(borrowapplyDAO.listUserInvest(pager, query));
        pager.setTotal(borrowapplyDAO.countUserInvest(query));
        return pager;
    }

    @Override
    public List<BorrowdetailAndWapplyVO> listBorrow(Integer type) {
        return borrowapplyDAO.listBorrow(type);
    }
    @Override
    public List<BorrowapplyInvestVO> listByInvest(String xmqx1, String xmqx2, String nysy1, String nysy2, String xmlx1, String search, Integer pageNum) {
        return borrowapplyDAO.listByInvest(xmqx1,xmqx2,nysy1,nysy2,xmlx1,search,pageNum);
    }

    @Override
    public Pager listAllOkborrow(Long offset, Long limit, Object query) {
        Pager pager = new Pager(offset, limit);
        pager.setRows(borrowapplyDAO.listAllOkborrow(pager, query));
        pager.setTotal(borrowapplyDAO.countAllOkborrow(query));
        return pager;
    }


    @Override
    public Integer countByInvest(String xmqx1, String xmqx2, String nysy1, String nysy2, String xmlx1, String search) {
        return borrowapplyDAO.countByInvest(xmqx1,xmqx2,nysy1,nysy2,xmlx1,search);
    }

    @Autowired
    public void setBorrowapplyDAO(BorrowapplyDAO borrowapplyDAO) {
        super.setBaseDAO(borrowapplyDAO);
        this.borrowapplyDAO = borrowapplyDAO;
    }

    @Autowired
    public void setShborrowDAO(ShborrowDAO shborrowDAO) {
        this.shborrowDAO = shborrowDAO;
    }

}
