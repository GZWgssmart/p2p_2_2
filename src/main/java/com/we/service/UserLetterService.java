package com.we.service;

public interface UserLetterService extends BaseService {

    /***
     *
     * @param ids ���id
     * @param status ��Ϣ��״̬
     * @returnӰ�������
     */
    Integer updateStatus(String ids,String status);
}
