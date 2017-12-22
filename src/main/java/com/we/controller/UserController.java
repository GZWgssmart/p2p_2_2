package com.we.controller;

import com.we.bean.Recommend;
import com.we.bean.User;
import com.we.common.EncryptUtils;
import com.we.common.Pager;
import com.we.common.miaodi.IndustrySMS;
import com.we.enums.RequestResultEnum;
import com.we.service.RecommendService;
import com.we.service.UserService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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

    @RequestMapping("login_page")
    public String loginPage() {
        return "user/login";
    }

    @RequestMapping("register_page")
    public String registerPage() {
        return "user/register";
    }

    @PostMapping("register")
    @ResponseBody
    public RequestResultVO register(User user) {
        RequestResultVO statusVO = null;
        //账号 是否已存在
        if(userService.getByPhone(user.getPhone()) != null) {
            //数据库已存在该账号
            statusVO = RequestResultVO.status(RequestResultEnum.REGISTER_FAIL_HAVE_PHONE);
        }else{
            //是否有推荐码 数据库不存在该账号
             user.setUpwd(EncryptUtils.md5(user.getUpwd()));
            if(user.getTid() == null || "".equals(user.getTid())){
                //无推荐码
                userService.saveSelective(user);
                statusVO = RequestResultVO.status(RequestResultEnum.REGISTER_SUCCESS);
            }else{
                //有推荐码  先判断该推荐码是否存在
                //推荐码是否存在
                if(userService.getById(user.getTid()) != null){
                    //推荐码存在
                    userService.saveSelective(user);
                    Recommend recommend = new Recommend();
                    recommend.setTid(user.getTid());
                    recommend.setUid(user.getUid());
                    recommendService.saveSelective(recommend);
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
        return "user/pager_user";
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
            session.setAttribute("user",userLogin);
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
     * 手机号码验证
     * @param phone
     * @param code
     * @return
     */
    @RequestMapping("verify_phone")
    @ResponseBody
    public RequestResultVO updatePwd(String phone, String code){
        System.out.println(code);
        RequestResultVO statusVO = null;
        //如果验证码为空，，则点击的是获取验证码链接    不为空则点击的是验证按钮
        if(code == null || code == ""){
            //判断手机号码是否存在  存在发送验证码  不存在退出
            if(userService.getByPhone(phone) != null){
                phoneCode = "123456";
                        //IndustrySMS.execute(phone);
                System.out.println(phoneCode);
                statusVO = RequestResultVO.status(RequestResultEnum.UPDATE_UPWD_SENDCODE);
            }else{
                statusVO = RequestResultVO.status(RequestResultEnum.UPDATE_UPWD_NO_PHONE);
            }
        }else{
            //比对验证码
            System.out.println(phoneCode+"code");
            if(code.equals(phoneCode)){
                System.out.println("验证成功");
            }
        }

        return statusVO;
    }

    @GetMapping("home")
    public String home() {
        return "home";
    }

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
