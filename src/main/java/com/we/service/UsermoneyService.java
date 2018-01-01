package com.we.service;

import com.we.bean.Usermoney;

/**
 * Created by hasee on 2017/12/22.
 */
public interface UsermoneyService extends BaseService {

    Usermoney getByUid(Integer uid);

}
