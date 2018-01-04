package com.we.service;

import java.util.List;

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

    /**
     * 批量删除
     * @param huserIds
     */
    void deletes(String huserIds);
    
    /**
     * 查询用户的角色id集合
     */
    List<Integer> listRoleIds(Integer huserId);
}
