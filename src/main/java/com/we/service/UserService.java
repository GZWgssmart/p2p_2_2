package com.we.service;

public interface UserService extends BaseService {

    /**
     * 查询数据库是否有该号码
     * @param phone
     * @return
     */
    String isPhone(String phone);

    /**
     * 查询数据库是否有该id
     * @param id
     * @return
     */
    String isId(Integer id);
}
