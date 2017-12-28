package com.we.service;

public interface UserLetterService extends BaseService {

    /***
     * 删除选中的多行数据
     * @param ids 多个id
     * @return 影响行数
     */
    Integer removeRows(String ids);
}
