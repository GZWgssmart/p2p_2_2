package com.we.dao;

import com.we.vo.ComboboxVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JklxDAO extends BaseDAO {

    /**
     * 将查询出的借款类型 放到 下拉框中
     * @return 借款类型的列表（包含id，name）
     */
    List<ComboboxVO> listCombobox();
}