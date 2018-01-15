package com.we.dao;

import com.we.vo.ComboboxVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BzDAO extends BaseDAO {

    /**
     * 将查询出的标种数据 放到 下拉框中
     * @return 标种的列表（包含标种id，标种名称）
     */
    void removeByIds(List<Integer> ids);

    List<ComboboxVO> listCombobox();

    /**
     * 查询出所有不重复标种
     * @return
     */
    List<String> listByBzmame();
}