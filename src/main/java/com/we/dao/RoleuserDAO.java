package com.we.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

@Repository

public interface RoleuserDAO extends BaseDAO {

    void saveRoleuser(@Param("huserId") Integer huserId,@Param("roleIds") List<Integer> roleIds);

    void deletes(@Param("huserIds")List<Integer> huserIds);

    List<Integer> listRoleIds(@Param("huserId") Integer huserId);
}