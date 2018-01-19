package com.we.dao;

import com.we.vo.ComboboxVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BankcardDAO extends BaseDAO {

    /**
     * 查询前台用户有多少银行卡
     * @param uid
     * @return 下拉框列表
     */
    List<ComboboxVO> listCard(Integer uid);

}