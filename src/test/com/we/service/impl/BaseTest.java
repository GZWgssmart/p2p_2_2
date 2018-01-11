package com.we.service.impl;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created on 2017/12/8 14:38
 *
 * @author mh
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = {"classpath:/config/spring-context.xml", "classpath:/config/spring-mybatis.xml"})
public class BaseTest {
}
