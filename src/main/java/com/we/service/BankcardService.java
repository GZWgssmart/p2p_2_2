package com.we.service;

import com.we.vo.ComboboxVO;
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
}
