package com.we.service.impl;

import com.we.dao.MediaDAO;
import com.we.service.AbstractBaseService;
import com.we.service.MediaService;
import com.we.vo.MediaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ID.LQF on 2017/12/22.
 */
@Service
public class MediaServiceImpl extends AbstractBaseService implements MediaService {

    private MediaDAO mediaDAO;

    @Autowired
    public void setMediaDAO(MediaDAO mediaDAO) {
        super.setBaseDAO(mediaDAO);
        this.mediaDAO = mediaDAO;
    }

    @Override
    public List<MediaVO> listMedia() {
        return mediaDAO.listMedia();
    }

}
