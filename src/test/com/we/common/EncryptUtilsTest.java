package com.we.common;

import org.junit.Test;

import static org.junit.Assert.*;

public class EncryptUtilsTest {
    @Test
    public void md5() throws Exception {
        System.out.println(EncryptUtils.md5("123123"));
    }

}