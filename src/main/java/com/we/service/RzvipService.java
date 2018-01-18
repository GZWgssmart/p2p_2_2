package com.we.service;

import com.we.bean.Rzvip;

/**
 * Created by hasee on 2017/12/22.
 */
public interface RzvipService extends BaseService {

    Rzvip getByUid(Integer UserId);
}
