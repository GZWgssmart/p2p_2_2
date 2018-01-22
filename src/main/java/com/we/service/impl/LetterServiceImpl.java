package com.we.service.impl;

import com.we.bean.Letter;
import com.we.common.Pager;
import com.we.dao.LetterDAO;
import com.we.dao.UserDAO;
import com.we.dao.UserLetterDAO;
import com.we.service.AbstractBaseService;
import com.we.service.LetterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class LetterServiceImpl extends AbstractBaseService implements LetterService {

    private LetterDAO letterDAO;
    private UserLetterDAO userLetterDAO;
    private UserDAO userDAO;

    @Autowired
    public void setLetterDAO(LetterDAO letterDAO) {
        super.setBaseDAO(letterDAO);
        this.letterDAO = letterDAO;
    }

    @Override
    public Integer saveSelective(Object obj) {
        Integer result = 0;
        Letter letter = (Letter) obj;
        result += letterDAO.saveSelective(letter);
        List<Integer> uidList = userDAO.listUid();
        userLetterDAO.saveRelation(uidList, letter.getLid());
        return result;
    }

    @Override
    public Pager listAllLetter(Long offset, Long limit, Object query) {
        Pager pager = new Pager(offset,limit);
        pager.setRows(letterDAO.listAllLetter(pager, query));
        pager.setTotal(letterDAO.countAllLetter(query));
        return pager;
    }

    @Override
    public Long countAllLetter(Object obj) {
        return letterDAO.countAllLetter(obj);
    }

    @Autowired
    public void setUserLetterDAO(UserLetterDAO userLetterDAO) {
        this.userLetterDAO = userLetterDAO;
    }

    @Autowired
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }
}
