package com.we.controller;

import com.we.bean.Huser;
import com.we.common.EncryptUtils;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.HuserService;
import com.we.service.RoleuserService;
import com.we.vo.RequestResultVO;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Calendar;

/**
 * Created by ID.LQF on 2017/12/25.
 */
@Controller
@RequestMapping("/huser")
public class HuserController {

    @Autowired
    private HuserService huserService;
    @Autowired
    private RoleuserService roleuserService;

    @RequestMapping("check_vip")
    public String checkVip() {
        return "huser/vip/checkvip";
    }

    @RequestMapping("all_tx_check_page")
    public String txCheckPage() {
        return "huser/txcheck/all_tx_check";
    }

    @RequestMapping("all_okborrow_page")
    public String allOkBorrowPage() {
        return "huser/borrow/all_okborrow";
    }

    @RequestMapping("welcome_page")
    public String welcomePage() {
        return "huser/welcome_huser";
    }

    @RequestMapping("friend_pager")
    public String allFriend() {
        return "huser/friend/all_friend";
    }

    @RequestMapping("all_reward_setting_page")
    public String allRewardPager() {
        return "huser/reward/all_reward_setting";
    }

    @RequestMapping("notice_pager")
    public String allNoticePager() {
        return "huser/notice/all_notice";
    }

    @RequestMapping("all_shborrow_page")
    public String allBorrowCheckPage() {
        return "huser/borrow/all_shborrow";
    }

    @RequestMapping("all_letter_page")
    public String allLetterPage() {
        return "huser/letter/all_letter";
    }

    @RequestMapping("home_page")
    public String home() {
        return "huser/home";
    }

    @RequestMapping("all_dynamic_page")
    public String allDynamicPage() {
        return "huser/dynamic/all_dynamic";
    }

    @RequestMapping("all_media_page")
    public String allMediaPage() {
        return "huser/media/all_media";
    }

    @RequestMapping("all_homeimg_page")
    public String allHomeImgPage() {
        return "huser/homeimg/all_homeimg";
    }

    @RequestMapping("all_recommend_page")
    public String allRecommendPage() {
        return "huser/recommend/all_recommend";
    }

    @RequestMapping("all_admin_page")
    public String allAdminPage() {
        return "huser/allAdmin";
    }

    @RequestMapping("add_huser_page")
    public String addHuserPage() {
        return "huser/add_huser";
    }

    @RequestMapping("all_huser_page")
    public String allHuserPage() {
        return "huser/all_huser_page";
    }

    @RequestMapping("all_sway_page")
    public String allSwayPage() {
        return "huser/sway/all_sway";
    }
    @RequestMapping("all_bz_page")
    public String allBzPage() {
        return "huser/bz/all_bz";
    }
 @RequestMapping("all_jklx_page")
    public String allJklxPage() {
        return "huser/jklx/all_jklx";
    }

 @RequestMapping("all_dxmodel_page")
    public String allDxmodelPage() {
        return "huser/dxmodel/all_dxmodel";
    }


    @ResponseBody
    @RequestMapping("list_pager")
    public Pager listPager(Long offset, Long limit) {
        Pager pager = huserService.listCriteria(offset, limit, Huser.class);
        return pager;
    }

    //后台管理员跳转到提现记录页面
    @RequestMapping("all_tx_log_page")
    public String txLogPage() {
        return "huser/txlog/all_tx_log";
    }

    /***
     * 条件分页查询用户 站内信
     * @param offset 开始索引
     * @param limit 查询个数
     * @param huser 用于接收页面传替的huid
     * @return 带结果的分页的对象
     */


    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit, Huser huser) {
        return huserService.listCriteria(offset, limit, huser);
    }

    @RequestMapping("add")
    @ResponseBody
    public RequestResultVO add(Huser huser, String roleIds) {
        huser.setCreateTime(Calendar.getInstance().getTime());
        huser.setPassword(EncryptUtils.md5("123456"));
        huserService.save(huser);
        if (roleIds != null && roleIds != "") {
            roleuserService.saveRoleuser(huser.getHuid(), roleIds);
        }
        return RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
    }

    @RequiresRoles("superadmin")
    @RequestMapping("update")
    @ResponseBody
    public RequestResultVO update(Huser huser, String roleIds,HttpSession session) {
        huserService.update(huser);
        if (roleIds == null){
            //管理员更新自己的信息
            session.setAttribute(OurConstants.SESSION_IN_HUSER,huserService.getById(huser.getHuid()));
        }
        if (roleIds == ""){
            //去掉用户的权限
            roleuserService.deletes(String.valueOf(huser.getHuid()));
        }
        if(roleIds != null && roleIds != ""){
            //更新用户权限
            roleuserService.deletes(String.valueOf(huser.getHuid()));
            roleuserService.saveRoleuser(huser.getHuid(),roleIds);
        }
        return RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
    }

    @RequestMapping("deletes")
    @ResponseBody
    public RequestResultVO deletes(String huserIds) {
        huserService.deletes(huserIds);
        roleuserService.deletes(huserIds);
        return RequestResultVO.status(RequestResultEnum.REMOVE_SUCCESS);
    }

    @RequestMapping("login")
    @ResponseBody
    public RequestResultVO login(Huser huser, HttpSession session){
        Subject subject= SecurityUtils.getSubject();
        UsernamePasswordToken token = null;
        if(huser.getEmail() != null && huser.getEmail() != ""){
            token = new UsernamePasswordToken(huser.getEmail(), EncryptUtils.md5(huser.getPassword()));
        }else if(huser.getPhone() != null && huser.getPhone() != ""){
            token = new UsernamePasswordToken(huser.getPhone(), EncryptUtils.md5(huser.getPassword()));
        }
        try{
            subject.login(token);
            return RequestResultVO.status(RequestResultEnum.LOGIN_SUCCESS);
        }catch(Exception e){
            e.printStackTrace();
            return RequestResultVO.status(RequestResultEnum.LOGIN_FAIL_ACCOUNT);
        }
    }

    @RequestMapping("all_invest_page")
    public String allInvestPage(){
        return "huser/tz/all_invest_page";
    }

    @RequestMapping("all_ydata_page")
    public String allYDdatePage(){
        return "huser/all_ydata_page";
    }

    /**
     * 所有的资金流向
     * @return
     */
    @RequestMapping("all_moneylog_page")
    public String allMoneyLog(){
        return "huser/moneylog/all_money_log";
    }

    @RequestMapping("login_page")
    public String loginPage(){
        return "huser/login";
    }

    @RequestMapping("get_by_id")
    @ResponseBody
    public Object getById(String huserId){
        return huserService.getById(Integer.valueOf(huserId));
    }

    @RequestMapping("change_password")
    @ResponseBody
    public RequestResultVO changePassword(Huser huser,String newPassword,String conPassword){
        if(newPassword.equals(conPassword)){
            Huser huser1 = (Huser)huserService.getById(huser.getHuid());
            if (huser1.getPassword().equals(EncryptUtils.md5(huser.getPassword()))){
                huser1.setPassword(EncryptUtils.md5(newPassword));
                huserService.update(huser1);
                return RequestResultVO.status(RequestResultEnum.UPDATE_UPWD_SUCCESS);
            }else {
                return RequestResultVO.status(RequestResultEnum.OLD_PWD_FAIL);
            }
        }else{
            return RequestResultVO.status(RequestResultEnum.NEW_PWDS_IS_DIFFERENT);
        }

    }

    @RequestMapping("logout")
    public String logout(Huser huser, HttpSession session){
        session.removeAttribute(OurConstants.SESSION_IN_HUSER);
        Subject subject = SecurityUtils.getSubject();
        if (subject != null) {
            subject.logout();
        }
        return "redirect:/";
    }
}

