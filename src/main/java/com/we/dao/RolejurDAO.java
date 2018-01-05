package com.we.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface RolejurDAO extends BaseDAO {


    void saveRoleJur(@Param("roleId") Integer roleId,@Param("jurIds") List<Integer> jurIds);

    void deletes(@Param("roleIds") List<Integer> roleIds);

    void deletesByjurIds(@Param("jurIds") List<Integer> jurIds);

    List<Integer> listJurIds(@Param("roleId")Integer roleId);
}