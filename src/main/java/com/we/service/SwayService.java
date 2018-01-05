package com.we.service;

import java.util.List;

/**
 * Created by hasee on 2017/12/22.
 */
public interface SwayService extends BaseService {
    /**
     * 通过多个id 删除
     * @param ids
     */
    void removeByIds(List<Integer> ids);

}
