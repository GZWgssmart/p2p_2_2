package com.we.dao;

import com.we.bean.Huser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface HuserDAO extends BaseDAO {

    void deletes(@Param("huserIds") List<Integer> huserIds);

    /**
     * 通过用户名查询用户
     * @param name
     * @return
     */
    public Huser getByName(@Param("name") String name);

    /**
     * 通过用户名查询角色信息
     * @param name
     * @return
     */
    public Set<String> getRolesByName(@Param("name") String name);

    /**
     * 通过用户名查询权限信息
     * @param name
     * @return
     */
    public Set<String> getPermissionsByName(@Param("name") String name);

    /**
     * 通过邮箱查询用户
     * @param email
     * @return
     */
    public Huser getByEmail(@Param("email") String email);

    /**
     * 通过邮箱查询角色信息
     * @param email
     * @return
     */
    public Set<String> getRolesByEmail(@Param("email") String email);

    /**
     * 通过email查询权限信息
     * @param email
     * @return
     */
    public Set<String> getPermissionsByEmail(@Param("email") String email);

    /**
     * 通过phone查询用户
     * @param phone
     * @return
     */
    public Huser getByPhone(@Param("phone") String phone);

    /**
     * 通过phone查询角色信息
     * @param phone
     * @return
     */
    public Set<String> getRolesByPhone(@Param("phone") String phone);

    /**
     * 通过phone查询权限信息
     * @param phone
     * @return
     */
    public Set<String> getPermissionsByPhone(@Param("phone") String phone);
}