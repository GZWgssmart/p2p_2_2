package com.we.controller;

import com.we.service.JurService;
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

    @RequestMapping("list")
    @ResponseBody
    public List<Object> list(){
        return jurService.listPager(null,null).getRows();
    }

    @RequestMapping("list_treeVO")
    @ResponseBody
    public List<JurTreeVO> listTreeVo(){
        List<JurTreeVO> jurTreeVOS = new ArrayList<>();
        for(Object o:jurService.listTreeVO()){
            JurTreeVO jurTreeVO = (JurTreeVO) o;
            jurTreeVOS.add(jurTreeVO);
        }
        return jurTreeVOS;
    }
}
