package com.we.service;

import com.we.bean.User;
import com.we.vo.CheckVipVO;
import com.we.vo.UserVO;

import java.util.List;

public interface UserService extends BaseService {

    /**
     * 通过号码查询用户
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
    Long countMonthById(String beginTime, String endTime);

    /**
     * 查询数据库有多少用户
     * @return
     */
    Long countUser();

    /***
     *
     * @param uid
     * @return
     */
    CheckVipVO getRzInfoById(Integer uid);


    /**
     * 查询支付码密码
     * @param userId
     * @return
     */
    Boolean getPayPwdByUserId (Integer userId,String payPwd);
}
