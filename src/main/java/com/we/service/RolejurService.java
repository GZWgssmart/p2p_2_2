package com.we.service;

/**
 * Created by hasee on 2017/12/22.
 */
public interface RolejurService extends BaseService {

    /**
     * 保存角色的权限
     * @param roleId
     * @param jurIds
     */
    void saveRoleJur(Integer roleId,String jurIds);
}
