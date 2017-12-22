package com.we.service;

import com.we.bean.User;

public interface UserService extends BaseService {

    /**
     * 通过号码查询数据库是否有该号码
     * @param phone
     * @return
     */
    User getByPhone(String phone);


}
