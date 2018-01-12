package com.we.service;

import com.we.vo.ComboboxVO;

import java.util.List;

/**
 * Created by hasee on 2017/12/22.
 */
public interface JklxService extends BaseService{

    /**
     * 将查询出的借款类型 放到 下拉框中
     * @return 借款类型的列表（包含id，name）
     */
    void removeByIds(List<Integer> ids);

    List<ComboboxVO> listCombobox();
}
