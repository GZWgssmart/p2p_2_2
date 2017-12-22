package com.we.dao;

import com.we.common.Pager;

import java.util.List;

/**
 * 基础的DAO接口，定义了DAO常用的方法。
 * @author mh
 */
public interface BaseDAO {

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
     * @param pager 分页对象
     * @param object 条件对象
     * @return 查询结果
     */
    List<Object> listCriteria(Pager pager, Object object);

    /**
     * 条件计数
     *
     * @param obj 条件对象
     * @return 结果总数
     */
    Long countCriteria(Object obj);
}
