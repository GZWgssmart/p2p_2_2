package com.we.service;

import com.we.bean.Huser;

import java.util.Set;

/**
 * Created by hasee on 2017/12/22.
 */
public interface HuserService extends BaseService {

    void deletes(String huserIds);

    /**
     * 通过用户名查询用户
     * @param name
     * @return
     */
    public Huser getByName(String name);

    /**
     * 通过用户名查询角色信息
     * @param name
     * @return
     */
    public Set<String> getRolesByName(String name);

    /**
     * 通过用户名查询权限信息
     * @param name
     * @return
     */
    public Set<String> getPermissionsByName(String name);

    /**
     * 通过邮箱查询用户
     * @param email
     * @return
     */
    public Huser getByEmail(String email);

    /**
     * 通过邮箱查询角色信息
     * @param email
     * @return
     */
    public Set<String> getRolesByEmail(String email);

    /**
     * 通过email查询权限信息
     * @param email
     * @return
     */
    public Set<String> getPermissionsByEmail(String email);

    /**
     * 通过phone查询用户
     * @param phone
     * @return
     */
    public Huser getByPhone(String phone);

    /**
     * 通过phone查询角色信息
     * @param phone
     * @return
     */
    public Set<String> getRolesByPhone(String phone);

    /**
     * 通过phone查询权限信息
     * @param phone
     * @return
     */
    public Set<String> getPermissionsByPhone(String phone);

}
