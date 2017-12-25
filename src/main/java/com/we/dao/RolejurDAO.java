package com.we.dao;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface RolejurDAO extends BaseDAO {


    void saveRoleJur(Integer RoleId, List<Integer> JurIds);
}