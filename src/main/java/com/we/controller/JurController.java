package com.we.controller;

import com.we.service.JurService;
import com.we.service.RolejurService;
import com.we.vo.JurTreeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/jur")
public class JurController {

    @Autowired
    private JurService jurService;
    @Autowired
    private RolejurService rolejurService;

    @RequestMapping("list")
    @ResponseBody
    public List<Object> list(){
        return jurService.listPager(null,null).getRows();
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
}
