package com.we.dao;

import com.we.bean.UserTicket;
import com.we.vo.UserTicketVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface UserTicketDAO extends BaseDAO {

    /**
     * 根据uid、kid查询用户是否已经领过此券
     * @param uid 前台用户id
     * @param kid 优惠券id
     * @return 用户与券的关联对象
     */
    UserTicket getByUidKid(@Param("uid") Integer uid, @Param("kid") Integer kid);

    /**
     * 根据ticketIds 批量删除
     * @param ticketIds
     */
    void deletesByTicketId(@Param("ticketIds") List<Integer> ticketIds);

    /**
     * 查询用户可用的优惠券
     * @param userId
     * @return
     */
    List<UserTicketVO> queryUserTicket(Integer userId);
}