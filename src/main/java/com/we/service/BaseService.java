package com.we.service;

import com.we.common.Pager;

/**
 * 基础的Service接口，定义了Service常用的方法。
 * @author mh
 */
public interface BaseService {

    /**
     * 根据id删除一行数据
     * @param id 主键
     * @return 影响行数
     */
    Integer removeById(Integer id);

    /**
     * 保存数据（会保存空属性）
     * @param obj 实体对象
     * @return 影响行数
     */
    Integer save(Object obj);

    /**
     * 保存不为空的数据
     * @param obj 实体对象
     * @return 影响行数
     */
    Integer saveSelective(Object obj);

    /**
     * 根据主键查询一行数据
     * @param id 主键
     * @return 查询的实体对象
     */
    Object getById(Integer id);

    /**
     * 更新对象属性值不为空的所对应的数据库字段
     * @param obj 实体对象
     * @return 影响行数
     */
    Integer updateSelective(Object obj);

    /**
     * 更新对象
     * @param obj 实体对象
     * @return 影响行数
     */
    Integer update(Object obj);

    /**
     * 条件分页查询
     * @param offset 开始索引
     * @param limit 查询数
     * @param object 条件对象
     * @return 分页对象
     */
    Pager listCriteria(Long offset, Long limit, Object object);
}
