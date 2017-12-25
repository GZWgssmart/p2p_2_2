package com.we.service;

/**
 * Created by hasee on 2017/12/22.
 */
public interface RoleuserService extends BaseService {

    /**
     * 保存后台用户的角色
     * @param userId
     * @param roleIds
     */
    void saveRoleuser(Integer userId,String roleIds);
}
