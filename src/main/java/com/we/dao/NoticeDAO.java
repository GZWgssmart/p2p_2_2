package com.we.dao;

import com.we.bean.Notice;
import com.we.common.Pager;
import com.we.vo.NoticeVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NoticeDAO extends BaseDAO {

    List<Object> listAllNotice(@Param("pager") Pager pager,
                               @Param("query") Object object);

    Long countAllNotice(@Param("query")Object obj);

    List<Object> listAllPageNotice(@Param("pager") Pager pager,@Param("query") Object object);

    Long countAllPagerNotice(@Param("query") Object object);

    List<Notice> listQueryAllNotice();

    /**
     * 查询前4个最新公告
     * @return
     */
    List<NoticeVO> listNotice();

    /**
     * 分页查询所有公司动态
     * @return
     */
    List<Object> pageNotice(@Param("pager") Pager pager);


}