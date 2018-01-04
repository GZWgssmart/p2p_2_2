package com.we.service;

import com.we.bean.Tzb;
import com.we.dto.TzbDTO;

/**
 * Created by hasee on 2017/12/22.
 */
public interface TzbService extends BaseService {

    Integer save(TzbDTO tzbDTO);
}
