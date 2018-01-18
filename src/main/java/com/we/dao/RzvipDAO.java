package com.we.dao;

import com.we.bean.Rzvip;
import org.springframework.stereotype.Repository;

@Repository

public interface RzvipDAO extends BaseDAO {

    Rzvip getByUid(Integer UserId);
}