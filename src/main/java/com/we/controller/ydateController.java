package com.we.controller;

import com.we.common.DateUtil;
import com.we.service.YdateService;
import com.we.vo.YdataVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 123456 on 2018/1/10.
 */
@Controller
@RequestMapping("/ydate")
public class ydateController {

    @Autowired
    private YdateService ydateService;

    /**
     * 查询最近十二个月的运营数据
     */
    @RequestMapping("/year")
    @ResponseBody
    public List<YdataVo> yearYdate(){
        List<YdataVo> ydataVoList = ydateService.getYearYdate();
        List<YdataVo> ydataVoList1 = new ArrayList<>();
        for(YdataVo ydataVo:ydataVoList){
            YdataVo ydataVo1 = new YdataVo();
            ydataVo1.setYid(ydataVo.getYid());
            String[] time = DateUtil.DateToString(ydataVo.getDate()).split("-");
            if("01".equals(time[1])){
                ydataVo1.setStringDate(String.valueOf(Integer.parseInt(time[0]) - 1)+"年12月份");
            }else{
                ydataVo1.setStringDate(time[0]+"年"+String.valueOf(Integer.parseInt(time[1]) - 1)+"月份");
            }
            ydataVoList1.add(ydataVo1);
        }
        return ydataVoList1;
    }

}
