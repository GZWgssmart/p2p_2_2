package com.we.service;

import com.we.vo.ComboboxVO;

import java.util.List;

/**
 * Created by hasee on 2017/12/22.
 */
public interface BzService extends BaseService {

    /**
     * 将查询出的标种数据 放到 下拉框中
     * @return 标种的列表（包含标种id，标种名称）
     */
    List<ComboboxVO> listCombobox();
}
