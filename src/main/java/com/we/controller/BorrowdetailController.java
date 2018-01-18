package com.we.controller;

import com.we.bean.Borrowapply;
import com.we.bean.Borrowdetail;
import com.we.common.OurConstants;
import com.we.common.PathUtils;
import com.we.common.loan.Loan;
import com.we.common.loan.LoanCalculatorAdapter;
import com.we.common.loan.LoanUtil;
import com.we.controller.quertz.borrowapply;
import com.we.enums.RequestResultEnum;
import com.we.service.BorrowapplyService;
import com.we.service.BorrowdetailService;
import com.we.vo.BorrowDetailVO;
import com.we.vo.ClaculateEarnVO;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;

@Controller
@RequestMapping("/borrowdetail")
public class BorrowdetailController {

    private BorrowdetailService borrowdetailService;
    private BorrowapplyService borrowapplyService;

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(Borrowdetail borrowdetail, MultipartFile file) {
        RequestResultVO resultVO = null;
        try {
            String imgPath = PathUtils.mkUploadImgs();
            file.transferTo(new File(imgPath, file.getOriginalFilename()));
            borrowdetail.setYpic(OurConstants.PERFIX_IMG_PATH + borrowdetail.getYpic());
            borrowdetailService.updateSelective(borrowdetail);
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

    @GetMapping("getByApplyId/{baid}")
    @ResponseBody
    public Borrowdetail getByApplyId(@PathVariable Integer baid) {
        return borrowdetailService.getByApplyId(baid);
    }

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

    @RequestMapping("detail_page/{borrowId}")
    @ResponseBody
    public ModelAndView seeDetail(@PathVariable Integer borrowId){
        ModelAndView modelAndView = new ModelAndView("index/info/borrowdetail");
        BorrowDetailVO borrowDetailVO = borrowdetailService.getDetail(borrowId);
        borrowDetailVO.setSchedule((borrowDetailVO.getMoney().subtract(borrowDetailVO.getSymoney()).multiply(BigDecimal.valueOf(100))).divide(borrowDetailVO.getMoney(),2, RoundingMode.CEILING));
        modelAndView.addObject("borrow",borrowDetailVO);
        return modelAndView;
    }

    @RequestMapping("calculate_earn_page")
    public ModelAndView calculatEarnPage(ClaculateEarnVO claculateEarnVO){
        ModelAndView modelAndView = new ModelAndView("index/info/calculateEarn");
        modelAndView.addObject("claculateMoney",claculateEarnVO);
        return modelAndView;
    }

    @RequestMapping("calculate_earn")
    @ResponseBody
    public Loan calculatEarn(ClaculateEarnVO claculateEarnVO){
        LoanCalculatorAdapter calculator = LoanUtil.getCalculator(claculateEarnVO.getBzid());
        Loan loan = calculator.calLoan(LoanUtil.totalLoanMoney(claculateEarnVO.getMoney(), LoanUtil.PERCENT),
                claculateEarnVO.getTerm(),
                LoanUtil.rate(claculateEarnVO.getNprofit().doubleValue(), LoanUtil.RATEDISCOUNT),
                LoanUtil.RATE_TYPE_YEAR);
        return loan;
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
