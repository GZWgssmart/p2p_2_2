package com.we.service.impl;

import com.we.bean.Letter;
import com.we.service.LetterService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Calendar;

public class LetterServiceTest extends BaseTest {

    @Autowired
    private LetterService letterService;

    @Test
    public void testSave() {
        Letter letter = new Letter();
        letter.setTitle("奖励通知");
        letter.setContent("恭喜您，中奖100万");
        letter.setDate(Calendar.getInstance().getTime());
        letter.setState(0);
        letterService.save(letter);
    }


}
