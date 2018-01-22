package com.we.dao;

import com.we.bean.User;
import com.we.vo.CheckVipVO;
import com.we.vo.UserVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDAO extends BaseDAO {

    /**
     * 通过手机查询用户
     * @param phone
     * @return
     */
    User getByPhone(String phone);

    /**
     * 通过邮箱查询用户
     * @param email
     * @return
     */
    User getByEmail(String email);

    /**
     * 通过邮箱或电话号码登入
     * @param user
     * @return
     */
    User getByPhoneOrEmailAndUpwd(User user);

    /**
     * 通过手机号码修改登入密码
     * @param user
     */
    void updateByPhone(User user);

    /**
     * 查询投资过的用户
     * @return
     */
    List<Integer> getUserId();

    /**
     * 查询月注册数
     * @param beginTime
     * @param endTime
     * @return
     */
    Long countMonthById(@Param("beginTime") String beginTime, @Param("endTime") String endTime);

    /**
     * 查询数据库有多少用户
     * @return
     */
    Long countUser();

    /***
     * 查询用户详情
     * @param uid
     * @return
     */
    CheckVipVO getRzInfoById(Integer uid);

    /**
     * 查询支付码密码
     * @param userId
     * @return
     */
    String getPayPwdByUserId (Integer userId);

    /**
     * 后台用户添加站内信时，需要向每个用户插入关联数据
     * @return 前台用户id集合
     */
    List<Integer> listUid();
}