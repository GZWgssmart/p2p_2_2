package com.we.service;

import com.we.bean.HomeImg;

import java.util.List;

/**
 * Created by ID.LQF on 2017/12/22.
 */
public interface HomeImgService extends BaseService {

    /**
     * 查询前5个首页图片的数据
     * @return
     */
    List<HomeImg> listHomeImg();

}
