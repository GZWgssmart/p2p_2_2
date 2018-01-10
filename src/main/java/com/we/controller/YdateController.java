package com.we.controller;

import com.we.bean.Ydate;
import com.we.common.DateUtil;
import com.we.service.YdateService;
import com.we.vo.YdataVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 123456 on 2018/1/10.
 */
@Controller
@RequestMapping("/ydate")
public class YdateController {

    @Autowired
    private YdateService ydateService;

    /**
     * 查询最近十二个月的运营数据
     */
    @RequestMapping("/year")
    @ResponseBody
    public List<YdataVO> yearYdate(){
        List<YdataVO> ydataVOList = ydateService.getYearYdate();
        List<YdataVO> ydataVOList1 = new ArrayList<>();
        for(YdataVO ydataVO : ydataVOList){
            YdataVO ydataVO1 = new YdataVO();
            ydataVO1.setYid(ydataVO.getYid());
            String[] time = DateUtil.DateToString(ydataVO.getDate()).split("-");
            if("01".equals(time[1])){
                ydataVO1.setStringDate(String.valueOf(Integer.parseInt(time[0]) - 1)+"年12月份");
            }else{
                ydataVO1.setStringDate(time[0]+"年"+String.valueOf(Integer.parseInt(time[1]) - 1)+"月份");
            }
            ydataVOList1.add(ydataVO1);
        }
        return ydataVOList1;
    }

    @RequestMapping("/month/{yid}")
    @ResponseBody
    public Ydate monthYdate(@PathVariable("yid") Integer yid){
        return (Ydate) ydateService.getById(yid);
    }

}
