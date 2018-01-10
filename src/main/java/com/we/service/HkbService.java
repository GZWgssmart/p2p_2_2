package com.we.service;

import com.we.bean.Hkb;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by hasee on 2017/12/22.
 */
public interface HkbService extends BaseService {
    /**
     * 查询交易总额
     * @return
     */
    void AllMoney();
}