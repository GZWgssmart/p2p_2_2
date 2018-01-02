package com.we.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserLetterDAO extends BaseDAO {

    /***
     *
     * @param ids ���Id
     * @param status ��Ϣ��״̬
     * @return Ӱ�������
     */
    Integer updateStatus(@Param("ids") List<Integer> ids, @Param("status") Integer status);

}
