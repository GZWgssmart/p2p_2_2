package com.we.dao;

import com.we.bean.Huser;
import com.we.bean.Reward;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RewardDAO extends BaseDAO {

    Reward getByIdAndTime(@Param("id") Integer id, @Param("time") String time);

}