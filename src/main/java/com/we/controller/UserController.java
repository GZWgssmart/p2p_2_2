package com.we.controller;

import com.we.bean.*;
import com.we.common.*;
import com.we.enums.RequestResultEnum;
import com.we.service.*;
import com.we.vo.CheckVipVO;
import com.we.vo.RequestResultVO;
import com.we.vo.UserVO;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;

/**
 * Created on 2017/12/8 19:07
 *
 * @author mh
 */
@Controller
@RequestMapping("/user")
public class UserController {

    private String phoneCode = "";

    @Autowired
    private UserService userService;

    @Autowired
    private RecommendService recommendService;

    @Autowired
    private TicketService ticketService;

    @Autowired
    private UserTicketService userTicketService;

    @Autowired
    private UsermoneyService usermoneyService;

    @Autowired
    private RzvipService rzvipService;

    @RequestMapping("all_invest_log_page")
    public String allInvestLogPage() {
        return "user/invest/log/all_invest_log";
    }

    @RequestMapping("all_invest_borrow_page")
    public String allInvestBorrowPage() {
        return "user/invest/borrow/all_invest_borrow";
    }

    @RequestMapping("all_borrow_checkok_page")
    public String allBorrowChcekokPage() {
        return "user/borrow/checkok/all_borrow_checkok";
    }

    @RequestMapping("welcome_page")
    public String welcomePage() {
        return "user/welcome_user";
    }

    @RequestMapping("home_page")
    public String homePage() {
        return "user/home";
    }

    @RequestMapping("all_letter_page")
    public String allLetterPage() {
        return "user/letter/all_letter";
    }

    @RequestMapping("all_notice_page")
    public String allNoticePage() {
        return "user/notice/all_notice";
    }

    @RequestMapping("all_borrow_money_page")
    public String allBorrowMoneyPage() {
        return "user/borrow/check/all_borrow_money";
    }

    /**
     * 后台用户审核VIP时，查看用户的认证信息
     * @return
     */
    @GetMapping("rz_info/{uid}")
    @ResponseBody
    public CheckVipVO rzInfo(@PathVariable Integer uid) {
       return userService.getRzInfoById(uid);
    }


    /**
     * 用户点击 所有借款 时，检查用户是否为VIP
     * @param session HttpSession
     * @return 请求结果
     */
    @RequestMapping("checkVip")
    @ResponseBody
    public RequestResultVO checkVip(HttpSession session) {
        RequestResultVO requestResultVO = null;
        User user = (User) session.getAttribute(OurConstants.SESSION_IN_USER);
        if (OurConstants.IS_VIP.equals(user.getIsVip())) {
            //是VIP，用js跳转页面 显示所有借款的页面
            requestResultVO = RequestResultVO.status(RequestResultEnum.HAVE_PERMISSION);
        } else {
            // 不是VIP， js弹窗提示
            requestResultVO = RequestResultVO.status(RequestResultEnum.NO_PERMISSION_BORROW_MONEY);
        }
        return requestResultVO;
    }

    @RequestMapping("login_page")
    public String loginPage() {
        return "user/login";
    }

    @RequestMapping("register_page")
    public ModelAndView registerPage(String uid) {
        ModelAndView mav = new ModelAndView("user/register");
        if(uid != null || uid != ""){
            mav.addObject("uid",uid);
        }
        return mav;
    }

    @PostMapping("register")
    @ResponseBody
    public RequestResultVO register(User user, String pcode) {
        RequestResultVO statusVO = null;
        //手机验证码
        if(!(pcode == null || pcode == "" || phoneCode.equals(pcode))){
            statusVO = RequestResultVO.status(RequestResultEnum.LOGIN_FAIL_CODE);
            return statusVO;
        }

        //账号 是否已存在
        if(userService.getByPhone(user.getPhone()) != null) {
            //数据库已存在该账号
            statusVO = RequestResultVO.status(RequestResultEnum.REGISTER_FAIL_HAVE_PHONE);
        }else{
            //是否有推荐码 数据库不存在该账号
             user.setUpwd(EncryptUtils.md5(user.getUpwd()));
            if(user.getTid() == null || "".equals(user.getTid())){
                //无推荐码
                user.setRegisterTime(new Date());
                userService.saveSelective(user);

                //生成注册优惠券
                Ticket ticket = TicketUtils.createUserRegisterTicket();
                ticketService.save(ticket);

                //保存优惠券
                UserTicket userTicket = TicketUtils.createUserTicket(user.getUid(),ticket.getUmid());
                userTicketService.saveSelective(userTicket);

                statusVO = RequestResultVO.status(RequestResultEnum.REGISTER_SUCCESS);
            }else{
                //有推荐码  先判断该推荐码是否存在
                //推荐码是否存在
                if(userService.getById(user.getTid()) != null){
                    //推荐码存在
                    user.setRegisterTime(new Date());
                    userService.saveSelective(user);
                    Recommend recommend = new Recommend();
                    recommend.setTid(user.getTid());
                    recommend.setUid(user.getUid());
                    recommend.setDate(Calendar.getInstance().getTime());

                    //生成新用户注册优惠券
                    Ticket ticket = TicketUtils.createUserRegisterTicket();
                    ticketService.save(ticket);

                    //保存新用户优惠券
                    UserTicket userTicket = TicketUtils.createUserTicket(user.getUid(),ticket.getUmid());
                    userTicketService.saveSelective(userTicket);

                    //生成推荐用户注册优惠券
                    Ticket ticket1 = TicketUtils.createUserRegisterTicket();
                    ticketService.save(ticket1);

                    //保存推荐优惠券
                    UserTicket userTicket1 = TicketUtils.createUserTicket(user.getTid(),ticket.getUmid());
                    userTicketService.saveSelective(userTicket1);

                    recommendService.saveSelective(recommend);
                    phoneCode = "";
                    statusVO = RequestResultVO.status(RequestResultEnum.REGISTER_SUCCESS);
                }else{
                    //推荐码不存在
                    statusVO = RequestResultVO.status(RequestResultEnum.REGISTER_FAIL_NOT_TID);
                }
            }
        }
        return statusVO;
    }

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(Long offset, Long limit) {
        return new RequestResultVO();
    }

    @RequestMapping("list_user")
    @ResponseBody
    public Pager listCash(Long offset, Long limit) {
        return new Pager();
    }

    @RequestMapping("all_user_page")
    public String allUserPage() {
//        return "user/all_user_page";

        if(UserUtils.isAdmin()){
            return "user/all_user_page";
        }else{
            return "";
        }

    }

    @RequestMapping("user_message")
    public String userMessage() {
        return "user/user_message";
    }

    @PostMapping("login")
    @ResponseBody
    public RequestResultVO login(User user, String code, HttpSession session) {
        RequestResultVO statusVO = null;
        user.setUpwd(EncryptUtils.md5(user.getUpwd()));
        User userLogin = userService.getByPhoneOrEmailAndUpwd(user);
        if(userLogin == null){
            //登入失败
            statusVO = RequestResultVO.status(RequestResultEnum.LOGIN_FAIL_ACCOUNT);
        }else{
            Usermoney usermoney = usermoneyService.getByUid(userLogin.getUid());
            session.setAttribute(OurConstants.SESSION_IN_USER,userLogin);
            session.setAttribute("usermoney",usermoney);
            statusVO = RequestResultVO.status(RequestResultEnum.LOGIN_SUCCESS);
        }
        return statusVO;
    }

    /**
     * 忘记密码前往验证手机号码页面
     * @param phone 可有可无   有：将值放入手机号码框  无：单纯跳转页面
     * @return
     */
    @RequestMapping("verify_phone_page")
    public ModelAndView forgetPwdPage(String phone){
        ModelAndView mav = new ModelAndView("user/verifyPhone");
        if(phone !=null || phone != ""){
            mav.addObject("userPhone", phone);
        }
        return mav;
    }

    /**
     * 已经注册的手机号码验证
     * @param phone
     * @param code
     * @return
     */
    @RequestMapping("verify_phone")
    @ResponseBody
    public RequestResultVO updatePwdVerify(String phone, String code){
        RequestResultVO statusVO = null;
        //如果验证码为空，，则点击的是获取验证码链接    不为空则点击的是验证按钮
        if(code == null || code == ""){
            //判断手机号码是否存在  存在发送验证码  不存在退出
            if(userService.getByPhone(phone) != null){
                phoneCode = "123456";//IndustrySMS.execute(phone);
                statusVO = RequestResultVO.status(RequestResultEnum.Code_SUCCESS);
            }else{
                statusVO = RequestResultVO.status(RequestResultEnum.UPDATE_UPWD_NO_PHONE);
            }
        }else{
            //比对验证码
            if(code.equals(phoneCode)){
                //验证码正确
                phoneCode ="";
                statusVO = RequestResultVO.status(RequestResultEnum.VERIFY_SUCCESS);
            }else{
                //验证码失败
                statusVO = RequestResultVO.status(RequestResultEnum.VERIFY_FAIL);
            }
        }

        return statusVO;
    }

    /**
     * 未注册的手机号码验证
     * @param phone
     * @param code
     * @return
     */
    @RequestMapping("no_register_verify_phone")
    @ResponseBody
        public RequestResultVO getVerify(String phone, String code){
        RequestResultVO statusVO = null;
        //如果验证码为空，，则点击的是获取验证码链接    不为空则点击的是验证按钮
        if(code == null || code == ""){
            //判断手机号码是否已经使用  未使用发送验证码  不存在退出
            if(userService.getByPhone(phone) == null){
                phoneCode = "654321";//IndustrySMS.execute(phone);
                statusVO = RequestResultVO.status(RequestResultEnum.Code_SUCCESS);
            }else{
                statusVO = RequestResultVO.status(RequestResultEnum.REGISTER_FAIL_HAVE_PHONE);
            }
        }else{
            //比对验证码
            if(code.equals(phoneCode)){
                //验证码正确
                statusVO = RequestResultVO.status(RequestResultEnum.VERIFY_SUCCESS);
                phoneCode ="";
            }else{
                //验证码失败
                statusVO = RequestResultVO.status(RequestResultEnum.VERIFY_FAIL);
            }
        }
        return statusVO;
    }

    @ResponseBody
    @RequestMapping("update_user")
    public RequestResultVO updatePhoneByUid(User user,String old, HttpSession session){
        RequestResultVO statusVO = null;
        if(!(user.getUpwd() == null || user.getUpwd() == "")){
            //修改密码
            User user1 = (User) userService.getById(user.getUid());
            if(user1.getUpwd().equals(EncryptUtils.md5(old))){
                //原始密码正确
                user.setUpwd(EncryptUtils.md5(user.getUpwd()));
                userService.updateSelective(user);
                statusVO = RequestResultVO.status(RequestResultEnum.UPDATE_PHONE_SUCCESS);
                session.removeAttribute(OurConstants.SESSION_IN_USER);
            }else{
                //原始密码错误
                statusVO = RequestResultVO.status(RequestResultEnum.OLD_PWD_FAIL);
            }
        }else{
            userService.updateSelective(user);
            statusVO = RequestResultVO.status(RequestResultEnum.UPDATE_PHONE_SUCCESS);
            session.setAttribute(OurConstants.SESSION_IN_USER,userService.getById(user.getUid()));
        }
        return statusVO;
    }

    /**
     * 跟新头像、性别和昵称
     * @param user
     * @param file
     * @return
     */
    @ResponseBody
    @RequestMapping("update_user_message")
    public RequestResultVO updateUserMessage(User user,MultipartFile file,HttpSession session){
        RequestResultVO statusVO = null;
        try {
            if (!user.getFace().equals("")) {
                String imgPath = PathUtils.mkUploadImgs();
                file.transferTo(new File(imgPath, file.getOriginalFilename()));
                user.setFace(OurConstants.PERFIX_IMG_PATH + user.getFace());
            }
            userService.updateSelective(user);
            User user1 = (User) userService.getById(user.getUid());
            session.setAttribute(OurConstants.SESSION_IN_USER,user1);
            statusVO = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
        } catch (IOException e) {
            e.printStackTrace();
            statusVO = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        } catch (RuntimeException e) {
            e.printStackTrace();
            statusVO = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return statusVO;
    }

    @RequestMapping("update_pwd_page/{phone}")
    public ModelAndView ModelAndView(@PathVariable("phone") String phone) {
        ModelAndView mav = new ModelAndView("user/updatePwd");
        mav.addObject("phone", phone);
        return mav;
    }

    @ResponseBody
    @RequestMapping("updatePwd")
    public RequestResultVO updatePwd(User user) {
        System.out.println(user);
        RequestResultVO statusVO = null;
        user.setUpwd(EncryptUtils.md5(user.getUpwd()));
        userService.updateByPhone(user);
        statusVO = RequestResultVO.status(RequestResultEnum.UPDATE_UPWD_SUCCESS);
        return statusVO;
    }

    @GetMapping("home")
    public String home() {
        return "user/home";
    }

    @GetMapping("safety")
    public String safety() {
        return "user/safety";
    }

    @ResponseBody
    @GetMapping("is_have_email")
    public boolean isEmail(String email){

        return userService.getByEmail(email) == null ? true :false;
    }

    @ResponseBody
    @RequestMapping("add_email")
    public RequestResultVO addEmail(User user, HttpSession session){
        RequestResultVO statusVO = null;
        userService.updateByPhone(user);
        statusVO = RequestResultVO.status(RequestResultEnum.ADD_EMAIL_SUCCESS);
        session.setAttribute("user",userService.getByEmail(user.getEmail()));
        return statusVO;
    }

    @ResponseBody
    @RequestMapping("get_phone_code")
    public RequestResultVO getPhoneCode(String phone){
        RequestResultVO statusVO = null;
        phoneCode = "123456";//IndustrySMS.execute(phone);
        statusVO = RequestResultVO.status(RequestResultEnum.Code_SUCCESS);
        return statusVO;
    }

    @ResponseBody
    @RequestMapping("count")
    public UserVO getCount(){
        UserVO userVO = new UserVO();
        userVO.setCount(userService.countUser());
        return userVO;
    }

    @RequestMapping("withdrawal")
    public String withdrawal(){
        return "user/withdrawal";
    }

    @RequestMapping("all_bankcard")
    public String allBankcard(){
        return "user/bankcard/all_bankcard";
    }

    @RequestMapping("ydate")
    public String ydate(){
        return "user/ydate";
    }

    @RequestMapping("user_money/{userId}")
    @ResponseBody
    public Usermoney getUserMonney(@PathVariable Integer userId){
        return usermoneyService.getByUid(userId);
    }

    @RequestMapping("pager_user")
    @ResponseBody
    public Pager pagerUser(Long offset,Long limit){
        return userService.listCriteria(offset,limit,null);
    }

    /**
     * 用户退出
     * @param session
     * @return
     */
    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.removeAttribute(OurConstants.SESSION_IN_USER);
        Subject subject = SecurityUtils.getSubject();
        if (subject != null) {
            subject.logout();
        }
        return "redirect:/";
    }

    @RequestMapping("get_rz_detail/{userId}")
    @ResponseBody
    public Rzvip getRzDetail(@PathVariable Integer userId){
        return rzvipService.getByUid(userId);
    }

    @RequestMapping("con_pay_pwd/{userId}/{payPwd}")
    @ResponseBody
    public RequestResultVO conPayPwd(@PathVariable Integer userId,@PathVariable String payPwd){
        Boolean pwd = userService.getPayPwdByUserId(userId,EncryptUtils.md5(payPwd));
        if(pwd){
            return RequestResultVO.status(RequestResultEnum.PAY_PWD_TRUE);
        }else{
            return RequestResultVO.status(RequestResultEnum.PAY_PWD_ERROR);
        }
    }
}
