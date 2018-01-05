package com.we.controller;

import com.we.bean.Jur;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.JurService;
import com.we.service.RolejurService;
import com.we.vo.JurTreeVO;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/jur")
public class JurController {

    @Autowired
    private JurService jurService;
    @Autowired
    private RolejurService rolejurService;



    @RequestMapping("all_jur_page")
    public String allJurPage(){
        return "jur/all_jur_page";
    }

    @RequestMapping("list")
    @ResponseBody
    public List<Object> list(){
        return jurService.listPager(null,null).getRows();
    }

    @RequestMapping("list_pager")
    @ResponseBody
    public Pager lisPager(Integer offset,Integer limit){
        return jurService.listPager(Long.valueOf(offset),Long.valueOf(limit));

    }

    @RequestMapping("list_treeVO")
    @ResponseBody
    public List<JurTreeVO> listTreeVo(String  roleId){
        List<JurTreeVO> jurTreeVOS = new ArrayList<>();
        for(Object o:jurService.listTreeVO()){
            JurTreeVO jurTreeVO = (JurTreeVO) o;
            jurTreeVOS.add(jurTreeVO);
        }
        if(roleId != null && roleId != ""){
            List<Integer> jurids = rolejurService.listJurIds(Integer.valueOf(roleId));
            for(JurTreeVO jurTreeVO : jurTreeVOS){
                for(Integer id : jurids){
                    if(jurTreeVO.getId() == id){
                        jurTreeVO.setChecked(true);
                    }
                }
            }
            return jurTreeVOS;
        }else{
            return jurTreeVOS;
        }

    }

    /**
     * 批量删除权限
     * @param jurIds
     * @return
     */
    @RequestMapping("deletes")
    @ResponseBody
    public RequestResultVO deletes(String jurIds){
        rolejurService.deletesByJurIds(jurIds);
        jurService.deletes(jurIds);
        return RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
    }

    @RequestMapping("add")
    @ResponseBody
    public RequestResultVO add(Jur jur){
        jur.setCreateTime(Calendar.getInstance().getTime());
        jurService.save(jur);
        return RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
    }
}
