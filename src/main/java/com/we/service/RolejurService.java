package com.we.service;

import java.util.List;

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

    /**
     * 批量删除与角色绑定的权限
     * @param roleIds
     */
    void deletes(String roleIds);

    /**
     * 获取角色的权限id集合
     */
    List<Integer> listJurIds(Integer roleId);

}
