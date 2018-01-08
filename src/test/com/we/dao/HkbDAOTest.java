package com.we.dao;

import com.we.bean.Hkb;
import com.we.service.impl.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class HkbDAOTest extends BaseTest {

    private HkbDAO hkbDAO;

    @Test
    public void saveList() throws Exception {
        List<Hkb> hkbList = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            Hkb hkb = new Hkb();
            hkb.setUid(100000);
            hkbList.add(hkb);
        }
        hkbDAO.saveList(hkbList);
    }

    @Autowired
    public void setHkbDAO(HkbDAO hkbDAO) {
        this.hkbDAO = hkbDAO;
    }
}