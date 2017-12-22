package com.we.dao;

import com.we.bean.User;
import org.springframework.stereotype.Repository;
@Repository
public interface UserDAO extends BaseDAO {

    /**
     * Í¨¹ıºÅÂë²éÑ¯Êı¾İ¿âÊÇ·ñÓĞ¸ÃºÅÂë
     * @param phone
     * @return
     */
    User getByPhone(String phone);

    /**
     * é€šè¿‡é‚®ç®±æˆ–ç”µè¯å·ç ç™»å…¥
     * @param user
     * @return
     */
    User getByPhoneOrEmailAndUpwd(User user);

}