package com.we.dao;

import com.we.bean.User;
import org.springframework.stereotype.Repository;
@Repository
public interface UserDAO extends BaseDAO {

    /**
     * ͨ�������ѯ���ݿ��Ƿ��иú���
     * @param phone
     * @return
     */
    User getByPhone(String phone);


}