package com.we.service;

import com.we.dto.TzbDTO;
import com.we.vo.TzbVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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

    /**
     * 查询总交易笔数
     */
    Integer countDealNumber();

    /**
     * 查询出总投资数
     * @return
     */
    List<TzbVO> getAllMoney();

}
