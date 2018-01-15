package com.we.dao;

import com.we.vo.MediaVO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 媒体报道
 */
@Repository
public interface MediaDAO extends BaseDAO {

    /**
     * 查所有的媒体报道
     * @return
     */
    List<MediaVO> listMedia();

}