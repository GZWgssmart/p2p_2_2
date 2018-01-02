package com.we.controller;

import com.we.bean.Borrowapply;
import com.we.bean.Borrowdetail;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.common.PathUtils;
import com.we.enums.RequestResultEnum;
import com.we.service.BorrowapplyService;
import com.we.service.BorrowdetailService;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;

@Controller
@RequestMapping("/borrowdetail")
public class BorrowdetailController {

    private BorrowdetailService borrowdetailService;
    private BorrowapplyService borrowapplyService;

    @PostMapping("save")
    @ResponseBody
    public RequestResultVO save(Borrowdetail borrowdetail, MultipartFile file) {
        RequestResultVO resultVO = null;
        try {
            String imgPath = PathUtils.mkUploadImgs();
            file.transferTo(new File(imgPath, file.getOriginalFilename()));
            borrowdetail.setYpic(OurConstants.PERFIX_IMG_PATH + borrowdetail.getYpic());
            borrowdetailService.save(borrowdetail);
            Borrowapply borrowapply = new Borrowapply();
            borrowapply.setBaid(borrowdetail.getBaid());
            borrowapply.setState(OurConstants.BORROW_CHECK);
            borrowapplyService.updateSelective(borrowapply);
            resultVO = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        } catch (IOException e) {
            e.printStackTrace();
            resultVO = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        } catch (RuntimeException e) {
            e.printStackTrace();
            resultVO = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        return resultVO;
    }
    
    @Resource
    public void setBorrowdetailService(BorrowdetailService borrowdetailService) {
        this.borrowdetailService = borrowdetailService;
    }

    @Resource
    public void setBorrowapplyService(BorrowapplyService borrowapplyService) {
        this.borrowapplyService = borrowapplyService;
    }
}
