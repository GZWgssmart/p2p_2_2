package com.we.service;

import com.we.bean.Tzb;
import com.we.dto.TzbDTO;
import org.apache.ibatis.annotations.Param;

/**
 * Created by hasee on 2017/12/22.
 */
public interface TzbService extends BaseService {

    Integer save(TzbDTO tzbDTO);

    /**
     * 查询投资总额
     * @return www
     */
    Long countAllMoney();

    /**
     * 月投资人数
     */
    Long countUid(@Param("beginTime") String beginTime, @Param("endTime") String endTime);
}
