package com.we.service;

import com.we.bean.Bankcard;
import com.we.bean.User;
import com.we.vo.ComboboxVO;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/22.
 */
@Service
public interface BankcardService extends BaseService {

    /**
     * 查询前台用户有多少银行卡
     * @param uid
     * @return 下拉框列表
     */
    List<ComboboxVO> listCard(Integer uid);

    /**
     * 用户添加银行卡
     * @param user
     * @param bankcard
     * @return
     */
    RequestResultVO save(User user, Bankcard bankcard);
}
