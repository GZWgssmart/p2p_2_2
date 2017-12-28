package com.we.service;

public interface UserLetterService extends BaseService {

    /***
     *
     * @param ids 多个id
     * @param status 信息的状态
     * @return影响的行数
     */
    Integer updateStatus(String ids,String status);
}
