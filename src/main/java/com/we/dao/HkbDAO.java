package com.we.dao;

import com.we.bean.Hkb;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HkbDAO extends BaseDAO {

    /**
     * 查询交易总额
     * @return
     */
    Double getAllMoney();


    /**
     * 满标之后，生成还款表数据
     * @param hkbList 还款表List
     * @return 影响行数
     */
    Integer saveList(@Param("hkbList") List<Hkb> hkbList);

    /**
     * 查询所有还款逾期
     * @return
     */
    List<Hkb> getAllOverdue(String nowTime);
}