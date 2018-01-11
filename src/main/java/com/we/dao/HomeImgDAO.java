package com.we.dao;

import com.we.bean.HomeImg;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 首页信息
 */
@Repository
public interface HomeImgDAO extends BaseDAO {

    /**
     * 查询前5个首页图片的数据
     * @return
     */
    List<HomeImg> listHomeImg();

}