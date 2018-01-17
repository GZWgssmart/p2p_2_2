package com.we.service.impl;

import com.we.bean.Media;
import com.we.common.Pager;
import com.we.service.MediaService;
import com.we.vo.MediaVO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Calendar;
import java.util.List;

/**
 * Created by ID.LQF on 2017/12/24.
 */
public class MediaServiceTest extends BaseTest {

    @Autowired
    private MediaService mediaService;

    @Test
    public void testSave() {
        Media media = new Media();
        media.setContent("11111111");
        media.setDate(Calendar.getInstance().getTime());
        media.setPic("11111111");
        media.setTitle("11111111");
        media.setUrl("111111");
        mediaService.save(media);
    }

    @Test
    public void testUpdate() {
        Media media = new Media();
        media.setMid(1);
        media.setContent("222222");
        media.setDate(Calendar.getInstance().getTime());
        media.setPic("222222");
        media.setTitle("222222");
        media.setUrl("222222");
        mediaService.update(media);
    }

    @Test
    public void testListMedia() {
        List<MediaVO> mediaVOS = mediaService.listMedia();
        System.out.println(mediaVOS);
    }

    @Test
    public void testPageMedia() {
        Pager pager = mediaService.pageMedia(1l,2l);
        System.out.println(pager);
    }

}
